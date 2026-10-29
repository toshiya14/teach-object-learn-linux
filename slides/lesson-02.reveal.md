# 认识 Linux：内核、Shell 与"一切皆文件"

## 第 02 课 · 30 分钟

Note: 大家好，上一课我们把 Ubuntu 装好了。这一课我们要掀开盖子，看看 Linux 肚子里长什么样：最底层的内核、中间的 Shell，还有它最重要的一个想法——一切皆文件。听完这节课，你就明白为什么 Linux 这么设计了。

---

# 本节课你会学到

- 内核是什么 <!-- .element: class="fragment" -->
- Shell 与 bash <!-- .element: class="fragment" -->
- "一切皆文件"哲学 <!-- .element: class="fragment" -->
- 图形界面 vs 命令行 <!-- .element: class="fragment" -->
- 运行第一个命令 <!-- .element: class="fragment" -->

Note: 这节课有五个目标。第一，弄懂内核是什么；第二，搞清 Shell 和 bash 的关系；第三，理解 Linux 的"一切皆文件"思想；第四，分清图形界面和命令行；第五，亲手运行几个安全的命令。

---

# 内核是什么

- 比喻：发动机是汽车的"内核" <!-- .element: class="fragment" -->
- 内核 = 系统最底层的核心 <!-- .element: class="fragment" -->
- 直接管理 CPU、内存、硬盘、网卡 <!-- .element: class="fragment" -->
- 你平时看不到它，但它一刻不停 <!-- .element: class="fragment" -->

```
你（用户）
  ↕
Shell（翻译官）
  ↕
内核 Kernel（发动机，管硬件）
```

Note: 内核就好比汽车里的发动机，你开车用方向盘和油门，不会直接去碰发动机。Linux 的内核就是这台发动机，它藏在最底层，直接管理 CPU、内存、硬盘这些硬件。你看不到它，但它时刻在运转。

---

# Shell 是什么

- 比喻：方向盘 / 翻译官 <!-- .element: class="fragment" -->
- Shell 解析命令，执行功能或启动程序 <!-- .element: class="fragment" -->
- bash 是最常见的一种 Shell <!-- .element: class="fragment" -->
- 终端是运行 Shell 的"窗口" <!-- .element: class="fragment" -->

```
你 ──打字──▶ 终端 ──▶ Shell(bash) ──▶ 内核
                  ▲                     │
                  └────── 结果 ◀────────┘
```

Note: Shell 可以比作翻译官，但你输入的是有规则的命令。它解析命令，执行内置功能或启动程序，需要系统资源时再请求内核服务。bash 是一种 Shell，本课程使用它。终端窗口负责输入和显示结果，背景不一定是黑色。

---

# 用户态与内核态

- 比喻：银行大堂 vs 金库 <!-- .element: class="fragment" -->
- 用户态：普通程序，权限低 <!-- .element: class="fragment" -->
- 内核态：内核，权限最高 <!-- .element: class="fragment" -->
- 分层是为了安全 <!-- .element: class="fragment" -->

用户态/内核态 ≠ 普通用户/管理员

```
用户态 ──（权限低）──▶ 普通程序
内核态 ──（权限高）──▶ 内核，直接碰硬件
```

Note: 把普通程序和内核想成银行大堂与受保护的金库。普通程序在用户态，需要硬件服务时按规则请求内核。这样有助于安全与稳定，但不是绝不会故障的保证。注意，这不等于普通用户和管理员，管理员启动的普通程序也在用户态。

---

# "一切皆文件"

- 文档是文件 <!-- .element: class="fragment" -->
- 目录（文件夹）也是文件 <!-- .element: class="fragment" -->
- 许多设备有文件形式的访问入口 <!-- .element: class="fragment" -->
- 系统信息也是文件（在 /proc） <!-- .element: class="fragment" -->

```
许多对象提供文件形式的入口
├─ 普通文件   报告.docx
├─ 目录        /home
├─ 设备       /dev/sda（硬盘）
└─ 系统信息   /proc/cpuinfo
```

Note: 一切皆文件是设计思想的概括。文档、目录、许多设备和系统信息，都有文件形式的访问入口。例如 dev 提供设备入口，proc 提供运行信息。它们不是同一种普通文件，也不能随意写入；好处是可以使用相似的访问方式。

---

# 图形界面 vs 命令行

- 图形界面：鼠标点点点，直观 <!-- .element: class="fragment" -->
- 命令行：敲命令，精确高效 <!-- .element: class="fragment" -->
- 底层做的是同一件事 <!-- .element: class="fragment" -->
- 按钮可能直接调用程序功能 <!-- .element: class="fragment" -->

```
图形界面（GUI）  ⇄  命令行（CLI）
      鼠标点           敲命令
        └────── 同一件事 ──────┘
```

Note: 图形界面用鼠标点，命令行用文字表达操作。两者都能请求系统完成任务，但按钮不一定对应一条 Shell 命令，也可能直接调用程序功能。课程重点学习命令行，因为命令容易记录、重复执行，还能逐步用于自动化。

---

# 命令演示 1：echo

- `echo` 让 Shell 回显文字 <!-- .element: class="fragment" -->
- bash 通常用内置功能输出文字 <!-- .element: class="fragment" -->

```bash
echo "你好，Linux"
```

- 输出：`你好，Linux` <!-- .element: class="fragment" -->

Note: echo 用来回显文字。先看命令，再跟着输入，双引号使用英文符号，按回车应当看到你好，Linux。bash 通常自己执行这个内置功能，输出时使用系统服务，不是把整条命令交给内核解析。提示符不用一起输入。

---

# 命令演示 2：whoami

- `whoami` = 我是谁？ <!-- .element: class="fragment" -->
- 输出当前有效用户的用户名 <!-- .element: class="fragment" -->
- 系统时刻记得"你是谁" <!-- .element: class="fragment" -->

```bash
whoami
```

- 输出：`你的用户名` <!-- .element: class="fragment" -->

Note: whoami 可以理解为我是谁，它显示当前有效用户的用户名。正常登录又没有切换身份时，通常就是安装时设置的名字。大家的输出可能不同，这是正常的。先看我演示，再自己输入，记下结果，后面学习权限时还会用到这个概念。

---

# 命令演示 3：设备也是文件

- `/dev` = device（设备）目录 <!-- .element: class="fragment" -->
- 硬盘、终端等在这里都是"文件" <!-- .element: class="fragment" -->

```bash
ls /dev
```

- 先找 `tty`、`null`、`zero`；硬盘名称因配置而异 <!-- .element: class="fragment" -->

Note: ls 斜杠 dev 列出设备入口。先找 tty、null、zero，其中也有虚拟设备。硬盘可能叫 sda、vda 或 nvme0n1，请以实际版本和配置为准。没看到 sda 不代表安装失败。这里只查看名字，不向设备写入，以免影响磁盘数据。

---

# 命令演示 4：系统信息也是文件

- `/proc` 装着系统"实时信息" <!-- .element: class="fragment" -->
- 内存、CPU 状态都是文件 <!-- .element: class="fragment" -->

```bash
ls /proc
```

- 这些文件并不真在硬盘上，是内核临时"摆"出来的 <!-- .element: class="fragment" -->

Note: 第四个命令，ls 斜杠 proc。proc 目录里是系统运行时的实时信息，CPU、内存的状态都摆成文件给你看。有意思的是，这些文件并不真的存在硬盘上，是内核临时摆出来方便你查看的。这再次印证了"一切皆文件"。

---

# 动手实验（本课任务）

- 实验 A/B：运行 echo、whoami <!-- .element: class="fragment" -->
- 实验 C：ls /dev 找出 3 个设备文件 <!-- .element: class="fragment" -->
- 实验 D：ls /proc 观察系统信息 <!-- .element: class="fragment" -->
- 按示例查看或回显；不向 /dev、/proc 写入 <!-- .element: class="fragment" -->

Note: 今天有 A 到 D 四部分实验。前面已跟练，现在用五分钟完成记录：回显文字、当前用户名、三个设备名和两个 proc 条目。按给出的命令操作只会查看或回显，无需管理员权限。建议使用已有快照，不向设备和系统信息入口写入。

---

# 小结与作业

- 内核 = 发动机，Shell = 翻译官 <!-- .element: class="fragment" -->
- bash 是最常见的 Shell <!-- .element: class="fragment" -->
- 一切皆文件：文档、设备、信息 <!-- .element: class="fragment" -->
- echo / whoami / ls 三个命令 <!-- .element: class="fragment" -->

**作业**：完成实验 A/B/C/D，回答"Shell 和终端有什么区别"。

Note: 内核管资源，Shell 解析命令，终端负责输入输出，bash 是一种 Shell。一切皆文件概括了统一访问的思想。今天练了 echo、whoami、ls。课后完成四部分实验，说明终端和 Shell 的区别。下节课认识桌面与快照。
