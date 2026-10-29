# Linux 零基础课程大纲（49 课 · 每课 30 分钟）

> 环境：NanaBox + Ubuntu 26.04 LTS Desktop · Shell：bash · 零基础学员
> 每课只讲 3–5 个核心概念，均含可执行实验；危险命令一律加警告，实验前先打快照。

| 课号 | 标题 | 30 分钟重点 | 实验 | PPT 页数建议 |
| --- | --- | --- | --- | --- |
| 01 | 用 NanaBox 创建虚拟机并安装 Ubuntu 26.04 | ① NanaBox 新建虚拟机（CPU/内存/磁盘/ISO）② 安装 Ubuntu 26.04 桌面版全程 ③ Linux 文件系统与 Windows 的差异说明 ④ 最常用指令预告（ls/cd/pwd）⑤ 什么是 swap 分区、安装时为何要划分 | 亲手建一台虚拟机并完成系统安装，记录分区方案（含 swap） | 14 |
| 02 | 认识 Linux：内核、Shell 与"一切皆文件" | ① 内核与 Shell 是什么（生活比喻）② 用户态/内核态粗略概念 ③ "一切皆文件"哲学 ④ 终端、bash 是什么 ⑤ 图形界面与命令行的关系 | 打开终端，运行第一个命令，观察"文件"无处不在 | 12 |
| 03 | 桌面环境、快照与虚拟机管理 | ① 桌面环境组成 ② NanaBox 快照的用途与打法 ③ 恢复快照回滚 ④ 软件源与系统更新初识 | 为刚装好的系统打第一个快照，并做一次系统更新 | 10 |
| 04 | 目录结构（FHS）与路径 | ① 根目录 / 与常用目录（/home /etc /var /usr /bin /tmp）② 绝对路径与相对路径 ③ cd / pwd 用法 ④ ~ 与 . 和 .. 的含义 | 用 cd/pwd 遍历常用目录，说出每个目录的用途 | 12 |
| 05 | ext4 文件系统与 inode | ① 什么是文件系统 ② ext4 的特点 ③ inode 与数据块（比喻：书目录与正文）④ 文件名与 inode 的关系 ⑤ 挂载点的含义 | 用 df/stat 观察分区与 inode 信息 | 12 |
| 06 | 命令的构成与 ls 文件类型 | ① 命令的构成：命令 + 选项 + 参数 ② ls 常用选项（-l -a -h）③ 输出各列含义与文件类型（普通/目录/链接/设备）④ 颜色含义 ⑤ 通配符 * ? | 拆解一条命令的结构，再用 ls 列举目录、识别文件类型 | 12 |
| 07 | 创建与操作文件目录：mkdir touch cp mv rm | ① mkdir -p 建目录 ② touch 建空文件 ③ cp 复制 ④ mv 移动/改名 ⑤ rm 删除（**危险命令警告**） | 建目录、复制、改名、删除一组练习文件 | 12 |
| 08 | 权限基础：ls -l 与 chmod | ① 权限三组（属主/属组/其他）② r/w/x 含义 ③ chmod 数字法与符号法 ④ 目录权限的特殊性 ⑤ 危险：乱改 / 目录权限 | 创建文件并用 chmod 改变权限，观察访问结果 | 13 |
| 09 | chown、chgrp 与 sudo | ① 用户与组的概念 ② whoami/id ③ chown 改属主 ④ chgrp 改属组 ⑤ sudo 的功能与操作：以管理员身份执行、sudo -i、visudo 与 sudoers | 创建用户/组并改属文件，练习用 sudo 提权执行管理命令 | 12 |
| 10 | 硬链接与软链接（ln） | ① 什么是链接 ② 硬链接 ln ③ 软链接 ln -s ④ 二者区别 ⑤ 链接与 inode 的关系 | 为文件创建硬链接与软链接，比较 inode 编号 | 11 |
| 11 | tar 打包与压缩 | ① 打包 vs 压缩的区别 ② tar -cvf 打包 ③ tar -xvf 解包 ④ 配合 gzip/bzip2（-z/-j）⑤ tar -czf 常用组合 | 打包并压缩一个目录，再解压到别处还原 | 11 |
| 12 | rsync 同步与备份 | ① rsync 的作用（增量同步）② 基本语法 ③ 常用参数 -av ④ 本地同步演示 ⑤ 与 cp 的区别 | 用 rsync 把目录同步到备份位置，改文件后再次同步 | 11 |
| 13 | 挂载 mount、umount 与 fstab | ① 什么是挂载 ② mount 挂载分区 ③ umount 卸载 ④ /etc/fstab 开机自动挂载 ⑤ 卸载前注意事项（占用） | 挂载一个分区并写入 fstab，重启验证自动挂载 | 12 |
| 14 | 磁盘空间查看：df 与 du | ① df 查看分区使用量 ② df -h 人类可读 ③ du 查看目录占用 ④ du -sh 总结 ⑤ 磁盘满的常见排查思路 | 用 df/du 找出哪个目录占空间最大 | 10 |
| 15 | 查看文件内容：cat、less、head、tail | ① cat 输出整个文件 ② less 分页浏览 ③ head 看开头 ④ tail 看结尾 ⑤ tail -f 实时跟踪日志 | 用 tail -f 观察日志文件实时增长 | 11 |
| 16 | grep 文本查找 | ① grep 基本用法 ② 常用参数 -i -n -r -v ③ 正则表达式初识 ④ grep 与管道结合 ⑤ 递归搜索代码 | 在目录中递归搜索指定关键词 | 11 |
| 17 | sed 流编辑器 | ① sed 是什么（流式处理）② 打印/替换 s/// ③ 删除行 d ④ 定位行号/匹配 ⑤ 配合管道使用 | 用 sed 批量替换文件中的字符串 | 12 |
| 18 | jq 处理 JSON | ① 什么是 JSON ② jq 安装与基本查询 . ③ 取字段与数组 ④ 过滤与格式化 ⑤ 在管道中解析 API 输出 | 用 jq 解析一份 JSON 数据并提取字段 | 11 |
| 19 | nano 编辑器入门 | ① nano 打开/保存/退出 ② 底部快捷键说明（Ctrl+O/X）③ 编辑与查找 ④ 适合新手的优势 | 用 nano 新建并编辑一个文本文件 | 10 |
| 20 | vim 编辑器（上）：模式与基本编辑 | ① vim 三种模式（普通/插入/命令）② 打开、进入插入 i、保存退出 :wq ③ 移动光标 hjkl ④ 删除 dd、复制 yy、粘贴 p ⑤ 撤销 u | 用 vim 完成一次"建文件—编辑—保存"流程 | 12 |
| 21 | vim 编辑器（下）：查找替换与配置 | ① 查找 / ② 替换 :%s/// ③ 行号与跳转 ④ 简单配置 ~/.vimrc ⑤ vim 学习路线建议 | 用 vim 完成查找替换并保存一份 .vimrc | 12 |
| 22 | 系统信息：uname 与发行版信息 | ① uname 查看内核/架构 ② uname -a ③ /etc/os-release ④ hostname ⑤ 查看 CPU/内存信息命令 | 查看并记录自己系统的内核、版本、主机名 | 9 |
| 23 | 进程与监控：ps 与 top | ① 什么是进程 ② ps 查看进程 ③ ps aux 常用 ④ top 实时监控 ⑤ top 里各列含义（CPU/内存/PID） | 运行一个程序并用 ps/top 找到它 | 12 |
| 24 | 信号与结束进程：kill | ① 什么是信号 ② kill PID ③ 常用信号（TERM/KILL/INT）④ 后台任务 &、jobs、fg ⑤ Ctrl+C 的关系 | 后台运行 sleep，用 kill 结束并比较信号 | 11 |
| 25 | systemd 与 systemctl 基础 | ① 什么是 systemd/服务 ② systemctl 状态查看 status ③ start/stop/restart ④ enable/disable 开机自启 ⑤ 查看日志 | 管理一个服务（如 ssh）的启停与自启 | 12 |
| 26 | systemd 进阶：编写自己的服务单元 | ① 服务单元文件 .service 结构 ② Unit/Service/Install 段 ③ 写一个简单服务 ④ 重载 daemon-reload ⑤ 设置开机自启 | 编写并启用一个自制的 systemd 服务 | 13 |
| 27 | 定时任务 crontab | ① 什么是定时任务 ② crontab -e 编辑 ③ 时间五段格式（分时日月周）④ crontab -l 查看 ⑤ 日志与排查 | 设置一个每分钟执行的定时任务并验证 | 12 |
| 28 | 磁盘分区 fdisk（**危险命令**） | ① 磁盘/分区概念 ② fdisk -l 查看 ③ fdisk 交互分区 ④ 分区表类型 ⑤ 警告：误操作会毁数据，先快照 | 给虚拟磁盘新增一块并用 fdisk 分区（只练不格式化） | 13 |
| 29 | 格式化 mkfs 与 swap 管理 | ① mkfs 格式化 ② 文件系统类型选择 ③ swap 是什么、如何创建/启用 swapon ④ 调整 swappiness ⑤ 危险命令警告 | 格式化刚分的分区并创建、启用 swap | 12 |
| 30 | LVM 逻辑卷管理（进阶） | ① LVM 概念（PV/VG/LV）② 优势：可动态扩容 ③ 创建流程 ④ lvextend 扩容 ⑤ 与普通分区对比 | 用 LVM 建逻辑卷并在线扩容 | 13 |
| 31 | apt 软件源与系统更新 | ① 什么是软件源 ② /etc/apt/sources.list ③ apt update ④ apt upgrade ⑤ 换国内镜像源 | 查看源文件并执行一次 update/upgrade | 12 |
| 32 | apt 安装、卸载与查找程序 | ① apt install ② apt remove/purge ③ apt search ④ dpkg 与依赖 ⑤ snap 与 apt 的区别初识 | 用 apt 安装/卸载一个小工具（如 htop） | 12 |
| 33 | 从源码编译安装程序 | ① 为什么编译 ② 安装编译工具 build-essential ③ ./configure → make → make install ④ 依赖与错误排查 ⑤ 与 apt 的取舍 | 编译安装一个小开源程序并运行 | 13 |
| 34 | bash 变量 | ① 什么是变量 ② 定义与取值 $ ③ 环境变量 export ④ 常用内置变量（PATH/HOME/USER）⑤ 引号区别 | 定义变量、导出环境变量并打印 | 11 |
| 35 | bash 条件判断 if 与 case | ① if/elif/else 结构 ② test 与 [ ] ③ 数值/字符串比较 ④ case 多分支 ⑤ 脚本退出码 | 写一个按输入做判断的脚本 | 12 |
| 36 | bash 循环 for 与 while | ① for 遍历列表 ② for 计数 ③ while 条件循环 ④ break/continue ⑤ 循环处理批量文件 | 用循环批量重命名或处理一组文件 | 12 |
| 37 | bash 函数与脚本参数 | ① 定义函数 ② 调用与返回值 ③ 脚本参数 $1 $2 $# ④ 读取输入 read ⑤ 脚本加可执行权限运行 | 写一个带函数和参数的脚本并运行 | 12 |
| 38 | 综合脚本项目：一键备份脚本 | ① 需求拆解 ② 结合变量/条件/循环/函数 ③ 用 tar 打包 + rsync 同步 ④ 加日志与错误处理 ⑤ 放进 crontab | 编写并测试一个完整的备份脚本 | 13 |
| 39 | 网络基础：ip、ifconfig 与 ping | ① IP 地址/子网掩码 ② ip addr 查看地址（旧命令 ifconfig 已替代）③ ping 测连通 ④ 网关与 DNS ⑤ 网络不通排查思路 | 查看本机 IP 并 ping 网关与外网 | 12 |
| 40 | ssh 远程登录与密钥 | ① ssh 是什么 ② ssh 登录远程主机 ③ 密钥对原理 ④ ssh-keygen 生成密钥 ⑤ 配置免密登录 | 生成密钥并配置免密登录（本机或两台虚拟机） | 12 |
| 41 | curl 与 wget 下载与请求 | ① curl 抓取网页 ② curl -o 保存文件 ③ wget 下载 ④ 查看 HTTP 响应头 -I ⑤ 与 API 交互 | 用 curl/wget 下载文件并查看响应头 | 11 |
| 42 | 网络诊断：ss 与 netstat | ① 端口与连接 ② ss 查看监听端口 ③ ss -tlnp 常用 ④ 旧命令 netstat 已由 ss 替代 ⑤ 判断服务是否在监听 | 用 ss 查看 ssh 等服务的监听端口 | 11 |
| 43 | iperf3 网络性能测试 | ① 带宽/吞吐量概念 ② 安装 iperf3 ③ 服务端 -s 与客户端 -c ④ 测 TCP/UDP 吞吐 ⑤ 读结果含义 | 两台机器（或本机回环）测一次带宽 | 11 |
| 44 | iptables 防火墙（**危险命令**） | ① 什么是防火墙/规则 ② 查看规则 -L ③ 放行/拒绝端口 ④ 保存规则 ⑤ **警告：iptables -F 会清空规则**，先快照 | 添加一条允许/拒绝端口的规则并验证 | 13 |
| 45 | Docker 基础 | ① 容器 vs 虚拟机 ② 安装 docker ③ 镜像/容器概念 ④ docker run/ps/stop ⑤ 拉取并运行第一个容器 | 运行一个 hello-world 或 nginx 容器 | 13 |
| 46 | Docker 进阶：镜像与编排初识 | ① Dockerfile ② 构建镜像 build ③ 端口映射 -p ④ 卷挂载 -v ⑤ docker compose 初识 | 用 Dockerfile 构建自己的镜像并运行 | 13 |
| 47 | Podman 入门与 Docker 对比 | ① podman 与 docker 区别 ② 免守护进程/无 root ③ 命令兼容性 ④ 安装与基本用法 ⑤ 选择建议 | 用 podman 运行与 docker 相同的容器 | 12 |
| 48 | 综合项目：搭建一个小服务 | ① 需求分析（如静态网站/文件服务）② 结合 systemd/ssh/防火墙/容器 ③ 部署并验证 ④ 记录完整步骤 | 从零搭建一个可访问的小服务 | 14 |
| 49 | 总结与学习路线 | ① 49 课知识地图回顾 ② 常用命令速查总表 ③ 进阶路线（脚本/网络/容器）④ 认证与社区资源 ⑤ 下一步建议 | 完成一份"常用命令速查表"自测 | 12 |

## 覆盖命令清单（核对）

- 文件/权限：`ls` `cd` `pwd` `mkdir` `touch` `cp` `mv` `rm` `chmod` `chown` `chgrp` `ln` `tar` `rsync` `mount` `umount` `cat` `head` `tail` `less` `grep` `sed` `jq` `nano` `vim`
- 系统/进程/磁盘：`uname` `ps` `top` `kill` `systemctl` `crontab` `df` `du` `fdisk` `mkfs` `swapon` `stat`
- 软件：`apt` `dpkg` `./configure` `make`
- 脚本：变量/条件/循环/函数 `export` `read` `test`
- 网络/容器：`ip` `ifconfig` `ping` `ssh` `curl` `wget` `ss` `netstat` `iperf3` `iptables` `docker` `podman`
