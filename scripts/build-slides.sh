#!/usr/bin/env bash
#
# build-slides.sh —— 导出幻灯片
#
# 功能：
#   1. 用 marp-cli 把 slides/*.slides.md 导出为 exports/pptx/*.pptx（保留演讲者备注）
#   2. 用 reveal-md 把 slides/*.reveal.md 构建为 exports/reveal/<课号>/ 静态站点
#
# 用法：
#   bash scripts/build-slides.sh
#   bash scripts/build-slides.sh pptx      # 只导出 PPTX
#   bash scripts/build-slides.sh reveal    # 只构建 reveal.js
#   bash scripts/build-slides.sh check     # 只检查依赖是否就绪
#

set -euo pipefail

# 项目根目录（脚本所在目录的上一级）
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SLIDES_DIR="$ROOT_DIR/slides"
PPTS_DIR="$ROOT_DIR/exports/pptx"
REVEAL_DIR="$ROOT_DIR/exports/reveal"

# 可执行命令
NODE_BIN="${NODE_BIN:-node}"
NPM_BIN="${NPM_BIN:-npm}"
MARP_BIN="${MARP_BIN:-marp}"
REVEALMD_BIN="${REVEALMD_BIN:-reveal-md}"
# marp-cli v4 导出 PPTX/PDF 需要浏览器渲染；可用 BROWSER_PATH 指定可执行文件路径
BROWSER_PATH="${BROWSER_PATH:-}"

# 颜色输出
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; NC='\033[0m'
info()  { printf "${GREEN}[信息]${NC} %s\n" "$*"; }
warn()  { printf "${YELLOW}[警告]${NC} %s\n" "$*"; }
error() { printf "${RED}[错误]${NC} %s\n" "$*"; }

# 检测命令是否存在
have() { command -v "$1" >/dev/null 2>&1; }

# 检测可用于 marp 渲染的浏览器（chrome / chromium / edge / firefox）
find_browser() {
  if [ -n "$BROWSER_PATH" ] && [ -x "$BROWSER_PATH" ]; then
    echo "$BROWSER_PATH"
    return 0
  fi
  local b
  for b in google-chrome google-chrome-stable chromium chromium-browser microsoft-edge msedge firefox; do
    if command -v "$b" >/dev/null 2>&1; then
      command -v "$b"
      return 0
    fi
  done
  return 1
}

# ---------------------------------------------------------------------------
# 依赖检查
# ---------------------------------------------------------------------------
check_deps() {
  local ok=1

  info "检查运行环境…"

  if ! have "$NODE_BIN"; then
    error "未找到 node。请先安装 Node.js：https://nodejs.org/（推荐 LTS 版本）"
    ok=0
  else
    info "node：$($NODE_BIN --version 2>/dev/null || echo '已安装')"
  fi

  if ! have "$NPM_BIN"; then
    error "未找到 npm。安装 Node.js 时会自带 npm，请重新安装 Node.js。"
    ok=0
  else
    info "npm：$($NPM_BIN --version 2>/dev/null || echo '已安装')"
  fi

  if ! have "$MARP_BIN"; then
    warn "未找到 marp（marp-cli），可稍后用 npx 调用或全局安装："
    warn "  $NPM_BIN install -g @marp-team/marp-cli"
  else
    info "marp：已安装"
  fi

  if ! have "$REVEALMD_BIN"; then
    warn "未找到 reveal-md，可稍后用 npx 调用或全局安装："
    warn "  $NPM_BIN install -g reveal-md"
  else
    info "reveal-md：已安装"
  fi

  # 浏览器：marp-cli v4 导出 PPTX 必需（仅影响 PPTX，不影响 reveal 构建）
  if find_browser >/dev/null 2>&1; then
    info "浏览器：$(find_browser)"
  else
    warn "未找到浏览器（chrome/chromium/edge/firefox）。导出 PPTX 将失败。"
    warn "  可安装 Chrome，或用 BROWSER_PATH=... 指定浏览器路径。"
  fi

  [ "$ok" -eq 1 ]
}

# 输出安装指引并返回非零（不强制退出，方便 npx 兜底）
print_install_hint() {
  error "缺少必要依赖，请先安装。安装命令如下："
  echo ""
  echo "  # 1. 安装 Node.js 与 npm（推荐 LTS，官网或包管理器均可）"
  echo "  #    https://nodejs.org/"
  echo ""
  echo "  # 2. 全局安装 marp-cli 与 reveal-md"
  echo "  $NPM_BIN install -g @marp-team/marp-cli reveal-md"
  echo ""
  echo "  # 若不想全局安装，也可临时用 npx 运行："
  echo "  npx @marp-team/marp-cli --version"
  echo "  npx reveal-md --version"
  echo ""
}

# ---------------------------------------------------------------------------
# 导出 PPTX（Marp）
# ---------------------------------------------------------------------------
build_pptx() {
  info "导出 PPTX（marp-cli）…"
  mkdir -p "$PPTS_DIR"

  local src="$SLIDES_DIR"/*.slides.md
  # 无匹配文件时 glob 原样保留，需单独判断
  if ! compgen -G "$SLIDES_DIR"/*.slides.md >/dev/null 2>&1; then
    warn "slides/ 目录下没有 *.slides.md 文件，跳过 PPTX 导出。"
    return 0
  fi

  # 优先使用已安装的 marp；否则用 npx 兜底
  local MARP_CMD=()
  if have "$MARP_BIN"; then
    MARP_CMD=("$MARP_BIN")
  elif have "$NPM_BIN"; then
    warn "使用 npx 临时运行 @marp-team/marp-cli"
    MARP_CMD=("$NPM_BIN" "exec" "--yes" "@marp-team/marp-cli")
  else
    error "既没有 marp 也没有 npm，无法导出 PPTX。"
    return 1
  fi

  # --pptx：输出 PowerPoint 格式
  # 注意：Marp 会把 Markdown 中的 HTML 注释（<!-- 解说：... -->）自动作为
  # 演讲者备注写入 PPTX，无需额外参数。
  # （marp-cli v4 起 --notes 含义已改为"导出备注为文本文件"，且与 --pptx 互斥，
  #   因此这里不再使用 --notes。）

  # marp-cli v4 需要浏览器来渲染 PPTX/PDF；若找到浏览器则显式指定，避免自动探测失败
  local browser
  if browser="$(find_browser)"; then
    info "使用浏览器渲染：$browser"
    "${MARP_CMD[@]}" "$src" --pptx --browser-path "$browser" --output "$PPTS_DIR"
  else
    warn "未检测到 Chrome/Edge/Firefox。marp-cli v4 导出 PPTX 需要浏览器。"
    warn "  请安装 Chrome/Chromium 或用 BROWSER_PATH 指定浏览器路径后重试，例如："
    warn "    BROWSER_PATH=/path/to/chrome bash scripts/build-slides.sh pptx"
    return 1
  fi

  info "PPTX 已导出到 $PPTS_DIR"
  ls -1 "$PPTS_DIR"/*.pptx 2>/dev/null || true
}

# ---------------------------------------------------------------------------
# 构建 reveal.js 静态站点（reveal-md）
# ---------------------------------------------------------------------------
build_reveal() {
  info "构建 reveal.js（reveal-md）…"
  mkdir -p "$REVEAL_DIR"

  if ! compgen -G "$SLIDES_DIR"/*.reveal.md >/dev/null 2>&1; then
    warn "slides/ 目录下没有 *.reveal.md 文件，跳过 reveal 构建。"
    return 0
  fi

  local REVEALMD_CMD=()
  if have "$REVEALMD_BIN"; then
    REVEALMD_CMD=("$REVEALMD_BIN")
  elif have "$NPM_BIN"; then
    warn "使用 npx 临时运行 reveal-md"
    REVEALMD_CMD=("$NPM_BIN" "exec" "--yes" "reveal-md")
  else
    error "既没有 reveal-md 也没有 npm，无法构建 reveal。"
    return 1
  fi

  for f in "$SLIDES_DIR"/*.reveal.md; do
    # 课号：lesson-01.reveal.md -> lesson-01
    local name
    name="$(basename "$f" .reveal.md)"
    local out="$REVEAL_DIR/$name"
    info "构建 $name -> $out"
    # --static 输出静态站点目录；Note: 注释会被 reveal-md 识别为演讲者备注
    "${REVEALMD_CMD[@]}" "$f" --static "$out"
  done

  info "reveal 站点已构建到 $REVEAL_DIR"
}

# ---------------------------------------------------------------------------
# 主流程
# ---------------------------------------------------------------------------
main() {
  local mode="${1:-all}"

  case "$mode" in
    check)
      check_deps || { print_install_hint; exit 1; }
      exit 0
      ;;
    pptx)
      check_deps || { print_install_hint; exit 1; }
      build_pptx
      ;;
    reveal)
      check_deps || { print_install_hint; exit 1; }
      build_reveal
      ;;
    all)
      if ! check_deps; then
        print_install_hint
        # 仍尝试用 npx 兜底（若 node/npm 存在）
        if ! have "$NODE_BIN" || ! have "$NPM_BIN"; then
          exit 1
        fi
        warn "部分工具未全局安装，将尝试用 npx 兜底运行。"
      fi
      build_pptx
      build_reveal
      ;;
    *)
      echo "用法：bash scripts/build-slides.sh [all|pptx|reveal|check]"
      exit 1
      ;;
  esac

  info "全部完成。"
}

main "$@"
