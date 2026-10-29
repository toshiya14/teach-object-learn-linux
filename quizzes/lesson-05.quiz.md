# 第 05 课 · 小测验

> 共 5 题，每题 20 分。答案见文件末尾。

**1. "文件系统"最准确的理解是？**

A. 一种显卡驱动
B. 硬盘上"如何存放、查找文件"的规则
C. 一个杀毒软件
D. 一种网络协议

**2. Linux 最常用的文件系统是？**

A. NTFS
B. FAT32
C. ext4
D. APFS

**3. 文件的元信息（大小、权限、属主、时间等）存在哪里？**

A. 文件名里
B. 数据块里
C. inode 里
D. 内存里

**4. 关于 inode，下列说法正确的是？**

A. inode 里存了文件名
B. inode 里不存文件名，文件名存在目录里
C. inode 就是文件内容
D. 每个文件没有 inode

**5. 想查看文件 `/etc/hostname` 的 inode 号和大小，可以用哪个命令？**

A. `stat /etc/hostname`
B. `cd /etc/hostname`
C. `cat /etc/hostname`
D. `whoami`

---

## 答案

| 题号 | 答案 | 解析 |
| --- | --- | --- |
| 1 | B | 文件系统是硬盘上组织、查找文件的规则 |
| 2 | C | Linux 最常用 ext4 |
| 3 | C | 元信息存在 inode 里 |
| 4 | B | inode 不存文件名，文件名存在目录中 |
| 5 | A | `stat` 显示文件的 inode 元信息 |
