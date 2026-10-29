# Linux 零基础课程（49 课）

一套面向零基础学员的 Linux 入门课程，每课约 30 分钟，共 49 课。

## 技术环境

- 虚拟化：NanaBox（不支持时可用 VirtualBox / Hyper-V）
- 系统：Ubuntu 26.04 LTS Desktop（Ubuntu 26 桌面版）
- Shell：bash
- 教学语言：中文

## 目录结构

```
linux-course/
  AGENTS.md          课程生成规则
  README.md          本文件
  outline.md         49 课大纲（总表）
  lessons/           每课 Markdown 讲义
  slides/            Marp 与 reveal.js 幻灯片源文件
  labs/              实验手册
  answers/           实验答案
  quizzes/           小测验
  scripts/           导出 PPTX / reveal.js 的脚本
  assets/            图片、图标等资源
```

## 每课文件命名

- 讲义：`lessons/lesson-XX-<slug>.md`
- Marp 幻灯片：`slides/lesson-XX.slides.md`
- reveal.js 幻灯片：`slides/lesson-XX.reveal.md`
- 实验手册：`labs/lesson-XX.lab.md`
- 实验答案：`answers/lesson-XX.answers.md`
- 小测验：`quizzes/lesson-XX.quiz.md`

## 课程模块

| 模块 | 课号 | 内容 |
| --- | --- | --- |
| 一、环境准备 | 01–03 | NanaBox 建虚拟机、安装系统、桌面与快照 |
| 二、Linux 原理与文件系统 | 04–07 | 一切皆文件、目录结构、ext4/inode、路径 |
| 三、文件与权限 | 08–16 | ls/cp/mv/rm、chmod/chown、链接、tar、rsync、mount、df |
| 四、文本处理与编辑器 | 17–23 | cat/grep/sed/jq、nano、vim |
| 五、进程与系统管理 | 24–29 | uname/ps/top/kill、systemd、crontab |
| 六、磁盘与存储 | 30–32 | fdisk、mkfs/swap、LVM |
| 七、软件管理 | 33–35 | apt 源、apt 安装、编译安装 |
| 八、Shell 脚本 | 36–40 | 变量、条件、循环、函数、综合脚本 |
| 九、网络 | 41–46 | ip/ping、ssh、curl/wget、ss/netstat、iperf3、iptables |
| 十、容器与综合 | 47–49 | docker、podman、综合项目与总结 |

## 安全提醒

- 危险命令（`rm -rf`、`dd`、`fdisk`、`mkfs`、`iptables -F`）必须加警告。
- 实验前优先打快照，方便回滚。

## 使用

1. 从 `outline.md` 查看全课程大纲。
2. 按课号顺序阅读 `lessons/` 与 `labs/`。
3. 用 `scripts/build-slides.sh` 导出 PPTX 与 reveal.js（见下）。

## 导出幻灯片（scripts/build-slides.sh）

脚本会把：

- `slides/*.slides.md`（Marp）→ `exports/pptx/*.pptx`，并**保留备注作为演讲者备注**（Marp 自动把 `<!-- 解说：... -->` 注释写入 PPTX 演讲者备注）。
- `slides/*.reveal.md`（reveal.js）→ `exports/reveal/<课号>/` 静态站点（`Note:` 注释自动成为演讲者备注）。

### 依赖要求

- Node.js（含 npm）——推荐 LTS：https://nodejs.org/
- marp-cli：`npm install -g @marp-team/marp-cli`
- reveal-md：`npm install -g reveal-md`
- 浏览器（Chrome / Chromium / Edge / Firefox）——marp-cli v4 导出 PPTX 需要浏览器渲染

或一次性安装两个工具：

```bash
npm install -g @marp-team/marp-cli reveal-md
```

> 若未全局安装 marp / reveal-md，脚本会尝试用 `npx` 临时下载运行。
> 若浏览器不在默认位置，可用环境变量指定：`BROWSER_PATH=/path/to/chrome bash scripts/build-slides.sh pptx`。

### 用法

```bash
# 检查依赖是否就绪
bash scripts/build-slides.sh check

# 全部导出（PPTX + reveal.js）
bash scripts/build-slides.sh

# 只导出 PPTX
bash scripts/build-slides.sh pptx

# 只构建 reveal.js
bash scripts/build-slides.sh reveal
```
