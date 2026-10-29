下面是一套可直接落地的 **Linux 零基础 30 分钟/课完整大纲 + opencode + DeepSeek 提示词体系**。已加入你要求的 **jq** 和 **iptables**。总课时按 **49 课** 设计，可继续扩展。

---

# 一、课程定位

- 学员：零基础
- 虚拟化：NanaBox，若兼容性差则备用 VirtualBox / Hyper-V
- 系统：Ubuntu 26.04 LTS Desktop，即“桌面版/消费版”
- 节奏：每课约 30 分钟
- 产出：每课包含讲义、实验、答案、测验、PPT 大纲、动画顺序、解说词；对应课生成并验证通过后，再生成独立演讲稿
- 工具链：opencode + DeepSeek 生成 Markdown 文件
- PPT 方案：Marp 幻灯片 + reveal.js 动画版 + 解说备注

---

# 二、完整课程大纲：49 课

## 模块一：安装与入门

1. **NanaBox 创建虚拟机 + 安装 Ubuntu 26.04 Desktop + 文件系统/常用命令/swap 初识**  
   重点：新建虚拟机、ISO、UEFI、网络 NAT、安装、FHS 初识、`pwd ls cd man`、`free -h`、`swapon --show`。

2. **Linux 基本原理与文件系统深入**  
   重点：内核、发行版、Shell、终端、FHS、`/etc /var /usr /home /tmp /dev /proc /sys`。

3. **首次配置与快照**  
   重点：系统更新、快照、共享文件夹、剪贴板、分辨率、时间同步、sudo、用户。

## 模块二：文件、目录、权限

4. **目录与文件操作**  
   重点：`ls cd pwd mkdir touch cp mv rm`。

5. **文件类型、inode、软硬链接、find**  
   重点：`file stat ln find xargs`。

6. **权限基础**  
   重点：`rwx`、数字权限、`chmod chown chgrp umask`。

7. **特殊权限与 ACL**  
   重点：SUID、SGID、Sticky、`setfacl getfacl`。

8. **打包压缩与同步**  
   重点：`tar gzip zip rsync`。

9. **文本查看、重定向、管道**  
   重点：`cat less head tail > >> 2> | tee`。

## 模块三：文本处理

10. **grep 与正则表达式**  
    重点：`grep -i -r -n -v`、基础正则。

11. **sed 流编辑器**  
    重点：替换、删除、插入、按行处理。

12. **awk 字段处理**  
    重点：`$1 $NF NR NF -F`、条件、统计。

13. **jq 与 JSON 处理**  
    重点：`jq .`、筛选、管道、API 返回处理。

14. **cut sort uniq wc tr diff**  
    重点：文本统计、去重、排序、比较。

## 模块四：编辑器

15. **nano 入门**  
    重点：打开、保存、退出、搜索、剪切。

16. **vim 入门**  
    重点：模式、保存退出、搜索替换、可视模式、`.vimrc`、`vimtutor`。

## 模块五：磁盘、文件系统、挂载、swap

17. **磁盘分区 MBR/GPT**  
    重点：`lsblk blkid fdisk parted`。

18. **ext4 文件系统**  
    重点：`mkfs.ext4 fsck tune2fs dumpe2fs`、inode、日志。

19. **mount/umount/fstab**  
    重点：挂载、UUID、`nofail`、fstab 写错恢复。

20. **swap 分区与 swapfile**  
    重点：`mkswap swapon swapoff free swappiness zram`。

21. **LVM、RAID、磁盘配额简介**  
    重点：PV/VG/LV、RAID 0/1/5、quota。

## 模块六：系统、进程、日志

22. **进程管理**  
    重点：`top ps pgrep pkill kill nice renice`。

23. **作业控制与终端复用**  
    重点：`jobs fg bg nohup tmux screen`。

24. **systemd 基础**  
    重点：`systemctl status start stop enable disable`。

25. **日志与排障**  
    重点：`journalctl dmesg logrotate`。

26. **定时任务与时间**  
    重点：`crontab`、systemd timer、`timedatectl`。

## 模块七：软件包与编译

27. **apt 源与安装**  
    重点：`apt update upgrade install remove purge autoremove`、deb822 源。

28. **dpkg、snap、flatpak、PPA**  
    重点：包格式、依赖、锁、镜像源。

29. **编译安装程序**  
    重点：`build-essential gcc make cmake ./configure make install`。

## 模块八：Shell 与 Bash

30. **Bash 基础**  
    重点：shebang、执行权限、终端、`bash script.sh`。

31. **变量与环境变量**  
    重点：局部变量、`export`、引号、位置参数、`$?`。

32. **条件判断**  
    重点：`test [ ] [[ ]] if case`。

33. **循环与数组**  
    重点：`for while until`、数组、遍历。

34. **函数与脚本调试**  
    重点：函数、`return`、`source`、`set -euo pipefail`、`bash -x`、ShellCheck。

## 模块九：网络

35. **网络基础**  
    重点：IP、子网、网关、DNS、`ip ping traceroute`。

36. **端口与监听**  
    重点：`ss netstat nc tcpdump`。

37. **curl、wget、jq 处理 API**  
    重点：HTTP 状态码、`-I -X -d -H`、JSON。

38. **SSH 与远程传输**  
    重点：`ssh scp sftp ssh-keygen ssh-copy-id`、免密、隧道。

39. **网络性能与诊断**  
    重点：`iperf3 mtr dig nslookup`。

40. **iptables 与防火墙**  
    重点：`iptables nftables ufw`、规则、端口放行。

## 模块十：容器

41. **容器原理**  
    重点：namespace、cgroup、OCI、镜像分层。

42. **Docker 基础**  
    重点：安装、镜像、容器、volume、network。

43. **Dockerfile 与 Compose**  
    重点：构建、多阶段、compose。

44. **Podman 与 rootless**  
    重点：pod、rootless、systemd 集成。

45. **Registry、containerd、K8s 简介**  
    重点：镜像仓库、容器运行时、K8s 概念。

## 模块十一：备份、安全、运维、项目

46. **备份与恢复**  
    重点：`tar rsync dd`、3-2-1 原则、快照。

47. **安全与更新**  
    重点：SSH 加固、ufw、AppArmor、自动更新。

48. **性能排查**  
    重点：CPU、内存、磁盘、网络排查。

49. **综合项目与总复习**  
    重点：Web 服务 + 容器 + 备份 + 监控 + 排障。

---

# 三、项目文件结构

建议在 opencode 中创建：

```text
linux-course/
├── AGENTS.md
├── README.md
├── outline.md
├── lessons/
│   ├── lesson-01-nanabox-ubuntu-install.md
│   └── ...
├── slides/
│   ├── lesson-01.slides.md
│   ├── lesson-01.reveal.md
│   └── ...
├── labs/
│   ├── lesson-01.lab.md
│   └── ...
├── answers/
│   ├── lesson-01.answers.md
│   └── ...
├── quizzes/
│   ├── lesson-01.quiz.md
│   └── ...
├── speech/                         # 对应课生成并验证通过后再生成
│   ├── lesson-02-linux-core-shell-file.md
│   └── ...
├── scripts/
│   ├── build-slides.sh
│   └── check-course.sh
└── assets/
```

---

# 四、AGENTS.md：给 opencode 的核心系统提示词

把下面内容保存为 `AGENTS.md`，opencode 会优先读取。

```markdown
# Linux 零基础课程生成规则

## 角色
你是一位资深 Linux 讲师、运维工程师、课程设计师。你为零基础学员设计 30 分钟/课的 Linux 入门课程。

## 技术环境
- 虚拟化：NanaBox。若 NanaBox 不支持，则提示备用 VirtualBox / Hyper-V。
- 系统：Ubuntu 26.04 LTS Desktop，也称 Ubuntu 26 桌面版/消费版。
- Shell：bash。
- 教学语言：中文。
- 学员基础：零基础，不假设任何 Linux 知识。

## 总目标
生成一套完整 Linux 入门课程，包含：
- Markdown 讲义
- 实验手册
- 实验答案
- 小测验
- PPT 幻灯片源文件
- 每页动画顺序
- 每页解说词
- 导出 PPTX 和 reveal.js 的脚本

## 课程节奏
- 每课约 30 分钟。
- 每课只讲 3 到 5 个核心概念。
- 每课必须包含可执行实验。
- 命令先解释，再演示，再让学员练习。
- 危险命令必须加警告，例如 rm -rf、dd、fdisk、mkfs、iptables -F。
- 优先使用快照，鼓励学员实验前打快照。

## 输出文件规范
每课生成以下文件：
1. lessons/lesson-XX-<slug>.md
2. slides/lesson-XX.slides.md
3. slides/lesson-XX.reveal.md
4. labs/lesson-XX.lab.md
5. answers/lesson-XX.answers.md
6. quizzes/lesson-XX.quiz.md

## 讲义结构
每份讲义必须包含：
- 元信息：课号、标题、时长、模块、前置知识、学习目标
- 30 分钟时间轴
- 概念讲解：用生活比喻解释
- 命令演示：代码块 + 逐行解释
- 随堂实验
- 常见错误与排查
- 本课小结
- 作业
- 下一课预告

## 幻灯片规范
- 使用 Marp 格式：slides/lesson-XX.slides.md
- 同时生成 reveal.js 格式：slides/lesson-XX.reveal.md
- 每页必须有标题、要点、图示或代码
- 动画用分步标注：
  - Marp 中写 `[动画1]`、`[动画2]`
  - reveal.js 中使用 `<!-- .element: class="fragment" -->`
- 每页备注写解说词：
  - Marp 用 `<!-- 解说：... -->`
  - reveal.js 用 `Note: ...`
- 解说词口语化，每页 60 到 120 字。

## 命令正确性
- 对 Ubuntu 26.04 不确定的命令要标注“请以实际版本为准”。
- 旧命令 netstat、ifconfig 要说明已被 ss、ip 替代。
- 所有命令必须在 Ubuntu 桌面版中可运行。
- 涉及网络、磁盘、防火墙时，必须说明风险。

## 零基础原则
- 不堆术语。
- 每个术语第一次出现都要解释。
- 每课最后给一张“命令速查表”。
- 实验步骤要具体到输入什么、看到什么、为什么。
```

---

# 五、项目初始化提示词

在 opencode 中新建目录后，先发：

```text
请读取 AGENTS.md。
在当前目录创建 Linux 零基础课程项目结构：
linux-course/
  AGENTS.md
  README.md
  outline.md
  lessons/
  slides/
  labs/
  answers/
  quizzes/
  scripts/
  assets/

然后根据 AGENTS.md 生成 outline.md。
要求：
1. 共 49 课，每课 30 分钟。
2. 必须从 NanaBox 创建虚拟机、安装 Ubuntu 26.04 Desktop 开始。
3. 第一课覆盖：创建虚拟机、安装系统、Linux 文件系统说明、常用指令、swap 分区。
4. 第二课开始细说 Linux 基本原理、ext 分区、文件系统、权限。
5. 必须包含：
   chown chmod cp mv rm mkdir ls rsync mount umount fstab tar
   top df fdisk uname kill crontab
   grep tail sed cat jq
   nano vim
   systemd
   apt 源和安装程序
   编译安装程序
   bash 变量、条件、循环、函数
   netstat iperf3 ssh ping ifconfig curl wget iptables
   docker podman
6. 每课列出：课号、标题、30 分钟重点、实验、PPT 页数建议。
7. 输出为 Markdown 表格。
```

---

# 六、单课生成提示词模板

每次生成一课时，复制下面模板，替换 `{{}}`。

```text
请读取 AGENTS.md、outline.md。
现在生成第 {{课号}} 课：{{课标题}}。

必须生成以下文件：
1. lessons/lesson-{{两位课号}}-{{slug}}.md
2. slides/lesson-{{两位课号}}.slides.md
3. slides/lesson-{{两位课号}}.reveal.md
4. labs/lesson-{{两位课号}}.lab.md
5. answers/lesson-{{两位课号}}.answers.md
6. quizzes/lesson-{{两位课号}}.quiz.md

要求：
- 面向零基础。
- 时长严格 30 分钟，写清 0-5、5-10、10-20、20-25、25-30 分钟做什么。
- 讲义包含：目标、前置、时间轴、概念、命令演示、实验、常见错误、小结、作业、下一课预告。
- 幻灯片每页含标题、要点、代码或图示。
- 幻灯片必须标注动画顺序，例如 [动画1] 先出现概念，[动画2] 再出现命令。
- 每页必须有解说词，写在备注中。
- 实验必须可以在 Ubuntu 26.04 Desktop 中完成。
- 答案单独放在 answers 文件中。
- 小测验 5 题，附答案。
- 对危险命令加警告。
- 最后输出本课命令速查表。
- 本阶段先完成上述六份课程文件及验证；验证通过后，才能使用“演讲稿生成推荐提示词”生成独立演讲稿。
```

---

# 七、批量生成提示词

不建议一次生成 49 课。建议每 5 课一批，检查后再继续。

```text
请读取 AGENTS.md、outline.md。
从第 {{起始课}} 课到第 {{结束课}} 课，逐课生成。
每课都必须生成：
lessons、slides、labs、answers、quizzes 六类文件。
每课生成后，先自我检查：
1. 是否 30 分钟可讲完？
2. 是否零基础能懂？
3. 命令是否适用于 Ubuntu 26.04？
4. 是否有危险命令警告？
5. 幻灯片是否有动画标注和解说词？
6. 实验是否可复现？
检查通过后，再生成下一课。
不要跳课，不要合并课。
```

---

# 八、质量检查提示词

生成若干课后，用这个提示词让 DeepSeek 自查。

```text
请作为 Linux 课程质检员，检查 lessons/、slides/、labs/、answers/、quizzes/ 中最近生成的第 {{课号}} 课。

检查项：
1. 是否面向零基础，术语是否有解释。
2. 30 分钟时间轴是否合理。
3. 命令是否正确，是否适用于 Ubuntu 26.04 LTS Desktop。
4. 是否包含危险命令警告。
5. 实验步骤是否完整：输入、预期输出、原因。
6. 幻灯片是否每页有解说词。
7. 动画顺序是否明确。
8. 答案是否与实验一致。
9. 是否包含命令速查表。
10. 是否遗漏 jq、iptables、systemd、docker/podman 等本课要求。

输出：
- 问题列表
- 修改建议
- 直接给出需要替换的段落
```

---

# 九、PPT 导出提示词

让 opencode 生成导出脚本：

```text
请生成 scripts/build-slides.sh。
要求：
1. 使用 marp-cli 将 slides/*.slides.md 导出为 exports/pptx/*.pptx。
2. 导出时保留备注作为演讲者备注。
3. 使用 reveal-md 或 reveal.js 将 slides/*.reveal.md 构建为 exports/reveal/。
4. 如果工具未安装，给出安装命令。
5. 脚本要检查 node、npm、marp、reveal-md 是否存在。
6. 输出使用说明到 README.md。
```

参考脚本内容可由 DeepSeek 生成，核心命令类似：

```bash
npm i -g @marp-team/marp-cli
marp slides/lesson-01.slides.md -o exports/pptx/lesson-01.pptx --pptx --notes
```

---

# 十、推荐使用流程

1. 安装 opencode，配置 DeepSeek 模型。
2. 创建 `linux-course` 目录。
3. 把 `AGENTS.md` 保存进去。
4. 用“项目初始化提示词”生成 `outline.md`。
5. 人工检查 49 课大纲。
6. 用“单课生成提示词”生成第 1 课。
7. 检查第 1 课质量，重点看 NanaBox、Ubuntu 26.04、swap、文件系统、常用命令。
8. 用“批量生成提示词”每 5 课生成一次。
9. 用“质量检查提示词”逐课质检。
10. 用“PPT 导出提示词”生成 PPTX 和 reveal.js 网页版。
11. 检查六份课程文件齐全；若已有 `scripts/check-course.sh` 则运行，否则逐项核对，并记录内容验证结果。
12. 对应课生成并验证通过后，用“演讲稿生成推荐提示词”生成 `speech/lesson-{nn}-{slug-title}.md`，再核对演讲稿与课程的一致性。

---

# 十一、第一课建议内容，供 DeepSeek 对齐

第 1 课必须包含：

- NanaBox 新建虚拟机
- CPU、内存、磁盘、网络、UEFI、ISO
- 安装 Ubuntu 26.04 Desktop
- 分区建议：EFI 512M、`/` 20–40G、`/home` 剩余、swap 4–8G 或 swapfile
- Linux 文件系统 FHS：`/ /home /etc /var /usr /tmp`
- 常用命令：`pwd ls cd man sudo apt update`
- swap：`free -h`、`swapon --show`
- 实验：创建快照、查看根目录、查看 swap
- 作业：写出 5 个目录的作用
- 下一课预告：Linux 基本原理与文件系统深入

---

# 十二、注意事项

1. Ubuntu 26.04 请以官方实际发布名称为准，正式叫 **Ubuntu 26.04 LTS Desktop**。
2. NanaBox 若无法稳定运行桌面版，立即切换 VirtualBox 或 Hyper-V。
3. 30 分钟课不要塞太多命令。第一课内容很满，建议把安装过程做成演示，学员课后跟着做。
4. `fstab`、`iptables`、`fdisk`、`mkfs`、`dd` 必须加危险警告。
5. `netstat`、`ifconfig` 只作了解，实际教学用 `ss`、`ip`。
6. 每课都要求 DeepSeek 输出“命令速查表”，方便零基础复习。
7. 先只生成第 1 课，确认风格后再批量生成 49 课。

---

# 十三、演讲稿生成推荐提示词

演讲稿用于串联课堂讲解、翻页、动画、命令演示与学员练习，是独立的口语化授课稿。文件格式为 `speech/lesson-{nn}-{slug-title}.md`：`nn` 是两位课号，`slug-title` 沿用对应讲义文件的英文短标题，例如第二课为 `speech/lesson-02-linux-core-shell-file.md`。

**必须按“生成课程 → 验证课程 → 修复并复验 → 生成演讲稿”的顺序执行。只有对应课的讲义、Marp 幻灯片、reveal.js 幻灯片、实验、答案、测验六份文件已生成且验证通过，才可以开始生成演讲稿。** 缺文件、验证失败或无法完成必要验证时，先补齐、修复或报告阻塞，不要提前创建演讲稿。对应课内容更新后，也应先重新验证，再同步演讲稿。

验证既要检查文件完整，也要核对命令、实验与答案、测验、幻灯片页序与动画、解说词、时间安排和风险说明。记录实际验证方法与结果，区分文档检查、当前环境命令检查和 Ubuntu 26.04 Desktop 实测；未执行的检查不能写成已通过。

复制下面提示词，替换 `{{}}`：

```text
请读取 AGENTS.md、outline.md 和 overall.md。
为第 {{两位课号}} 课“{{课标题}}”生成一份大体演讲稿。

先检查对应课的以下六份课程文件已生成：
1. lessons/lesson-{{两位课号}}-{{slug-title}}.md
2. slides/lesson-{{两位课号}}.slides.md
3. slides/lesson-{{两位课号}}.reveal.md
4. labs/lesson-{{两位课号}}.lab.md
5. answers/lesson-{{两位课号}}.answers.md
6. quizzes/lesson-{{两位课号}}.quiz.md

强制前置条件：
- 只有对应课已生成并验证通过，才可以开始生成演讲稿。
- 检查术语解释、命令正确性与 Ubuntu 26.04 Desktop 适用性、实验输入/预期输出/原因、答案和测验的一致性。
- 核对两套幻灯片的页序、动画顺序、每页解说词和 30 分钟安排，检查危险命令及网络、磁盘、防火墙风险说明。
- 若发现缺失或错误，先补齐或修复课程材料，再重新验证；若必要验证无法完成，说明阻塞并暂停生成演讲稿。
- 使用项目中已有的适用检查工具；没有检查脚本时，逐项核对并执行适当的命令检查。
- 明确记录验证方法、结果和范围；未在 Ubuntu 虚拟机实测时如实注明，不得宣称已实测。

前置验证通过后，创建：
speech/lesson-{{两位课号}}-{{slug-title}}.md
其中 slug-title 与对应讲义文件名保持一致。

演讲稿要求：
1. 中文、口语化、面向零基础；写成可直接讲述的大体稿，使用生活比喻和自然过渡。
2. 基于已验证的六份材料，不增加超出本课范围的核心概念。
3. 包含使用说明、来源文件链接、生成前验证记录、30 分钟时间安排。
4. 按实际幻灯片逐页编排，注明页码、标题和时间段；标记【动画】【操作】【互动】【停顿】，使授课提示与口述正文清楚可辨。
5. 命令先解释，再展示教师输入与预期输出，最后安排学员跟练；具体说明观察什么、为什么。
6. 总时长约 30 分钟，包含演示、跟练、互动和停顿，不把 30 分钟全部写成连续朗读。
7. 包含开场、概念讲解、命令演示、实验引导、常见错误、小结、作业、下一课预告和命令速查表。
8. 保留课程中的快照建议和必要风险提醒；不确定的版本表现标注“请以实际版本为准”。
9. 生成后核对页码、命令、实验编号、答案、作业、下一课预告与来源一致，确认时间段合计 30 分钟且没有缺口或重叠。

最后简要报告：课程验证结果、演讲稿路径和演讲稿核对结果。
```

第二课的替换值示例：`两位课号 = 02`，`课标题 = 认识 Linux——内核、Shell 与“一切皆文件”`，`slug-title = linux-core-shell-file`。
