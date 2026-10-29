# ext4 文件系统与 inode

## 第 05 课 · 30 分钟

Note: 大家好，上一课我们逛了目录。这一课往硬盘深处看：文件到底是怎么存在硬盘上的？什么是 inode？为什么要知道这些？弄懂了，你对 Linux 的理解会再上一个台阶。

---

# 本节课你会学到

- 什么是文件系统 <!-- .element: class="fragment" -->
- ext4 的特点 <!-- .element: class="fragment" -->
- inode 与数据块 <!-- .element: class="fragment" -->
- 文件名与 inode 的关系 <!-- .element: class="fragment" -->
- 什么是挂载点 <!-- .element: class="fragment" -->

Note: 这节课五个目标。第一，弄懂文件系统是什么；第二，认识 ext4；第三，理解 inode 和数据块；第四，搞清文件名和 inode 的关系；第五，初步了解挂载点。

---

# 什么是文件系统

- 比喻：图书馆的管理规则 <!-- .element: class="fragment" -->
- 硬盘只是"空地"，文件系统是"怎么摆怎么找"的规则 <!-- .element: class="fragment" -->
- Windows 用 NTFS，Linux 用 ext4 <!-- .element: class="fragment" -->
- 硬盘要先格式化才能存文件 <!-- .element: class="fragment" -->

```
硬盘（空地） ──格式化──▶ 文件系统（有规则的仓库）
                         ├─ 怎么存
                         └─ 怎么找
```

Note: 文件系统就像图书馆的管理规则。硬盘本身只是一块能存数据的空地，文件系统决定数据怎么摆、怎么找。Windows 常用 NTFS，Linux 最常用 ext4。硬盘要先格式化成某种文件系统，才能正常存文件。

---

# ext4 是什么

- Linux 最广泛使用的文件系统 <!-- .element: class="fragment" -->
- Fourth Extended = 第四代扩展文件系统 <!-- .element: class="fragment" -->
- 稳定、支持大文件大分区、性能好 <!-- .element: class="fragment" -->
- Ubuntu 默认用它格式化根分区 <!-- .element: class="fragment" -->

```
ext2 → ext3 → ext4（升级版）
```

Note: ext4 是 Linux 里用得最广的文件系统，全称第四代扩展文件系统。它稳定可靠，支持大文件和大分区，性能也好。Ubuntu 装系统时，默认就用 ext4 来格式化根分区。它还有 ext2、ext3 这些前辈。

---

# inode 与数据块（重点）

- 数据块 = 书架，真正放文件内容 <!-- .element: class="fragment" -->
- inode = 目录卡片，记录元信息 <!-- .element: class="fragment" -->
- inode 记录：大小、权限、属主、时间、内容在哪 <!-- .element: class="fragment" -->
- inode 里不存文件名 <!-- .element: class="fragment" -->

```
文件 = 数据块（正文） + inode（目录卡片）
                    ├─ 大小
                    ├─ 权限
                    ├─ 属主
                    └─ 时间
```

Note: 这是今天的重点。一个文件分成两部分：数据块真正放内容，就像书架上的书页；inode 记录元信息，就像图书馆的目录卡片，写着大小、权限、属主、时间，以及内容放在哪些数据块。特别记住，inode 里不存文件名。

---

# 文件名与 inode 的关系

- 文件名存在"目录"里 <!-- .element: class="fragment" -->
- 目录里记录：文件名 → inode 号 <!-- .element: class="fragment" -->
- 文件名只是"标签" <!-- .element: class="fragment" -->
- 真正代表文件身份的是 inode 号 <!-- .element: class="fragment" -->

```
目录（书名索引）       inode（卡片）
《小王子》 ──▶ 123 ──▶ 大小/位置
《Le Petit Prince》─▶ 123（同一个文件！）
```

Note: 文件名和 inode 是分开的。文件名存在目录里，目录里记的是"这个名字对应哪个 inode 号"。所以文件名只是个标签，真正代表文件身份的是 inode 号。这也意味着，一个文件可以有好几个名字，后面讲硬链接时会用到。

---

# 挂载点是什么

- 分区不能凭空出现，要"挂"到目录上 <!-- .element: class="fragment" -->
- 挂载点 = 用来挂分区的那个目录 <!-- .element: class="fragment" -->
- 根分区挂在 / <!-- .element: class="fragment" -->
- U 盘常挂在 /media 下 <!-- .element: class="fragment" -->

```
分区A ──挂载──▶ /        （根分区）
分区B ──挂载──▶ /boot
U盘   ──挂载──▶ /media/xxx
```

Note: 挂载点这个概念先混个眼熟。一块分区不能凭空出现在系统里，必须挂到目录树上的某个目录，那个目录就是挂载点。根分区挂在斜杠，U 盘通常挂在 media 目录下。第 13 课会详细讲 mount 和 umount。

---

# 命令演示 1：df -h

- 查看分区和挂载点 <!-- .element: class="fragment" -->
- -h 用人类易读的单位 <!-- .element: class="fragment" -->

```bash
df -h
```

- 看到"文件系统"和"挂载点"两列 <!-- .element: class="fragment" -->

Note: 第一个命令，df 空格 减 h。它查看磁盘分区的使用情况，h 表示用 GB、MB 这些好读的单位。输出里重点看两列：文件系统列，比如 dev sda2；挂载点列，比如斜杠、boot。这就是分区挂到目录的直接体现。

---

# 命令演示 2：stat

- 查看文件的 inode 元信息 <!-- .element: class="fragment" -->

```bash
stat /etc/hostname
```

- 会显示：Inode 号、大小、权限、属主、时间 <!-- .element: class="fragment" -->

Note: 第二个命令，stat 后面跟一个文件路径。它把这个文件的 inode 元信息原原本本显示出来，包括 Inode 号、大小、权限、属主、最后修改时间。这些就是目录卡片上的内容。

---

# 命令演示 3：ls -i

- 列出文件并显示 inode 号 <!-- .element: class="fragment" -->

```bash
ls -i /etc/hostname
```

- 最前面那串数字就是 inode 号 <!-- .element: class="fragment" -->
- 每个文件的 inode 号唯一 <!-- .element: class="fragment" -->

Note: 第三个命令，ls 减 i。它列出文件，并在前面显示 inode 号。最前面那串数字就是 inode 号，同一个分区里每个文件的 inode 号都是唯一的，就像身份证号。

---

# 动手实验（本课任务）

- 实验 A：df -h 找根分区挂载点 <!-- .element: class="fragment" -->
- 实验 B：stat 读出 inode 号、大小、权限 <!-- .element: class="fragment" -->
- 实验 C：ls -i 对比不同文件的 inode 号 <!-- .element: class="fragment" -->
- 提示：本课命令都只读，安全 <!-- .element: class="fragment" -->

Note: 今天三个实验。第一，用 df 减 h 找出根分区的挂载点；第二，用 stat 读出某个文件的 inode 号、大小、权限；第三，用 ls 减 i 对比不同文件的 inode 号，验证每个文件号都唯一。这些命令都只读，非常安全。

---

# 小结与作业

- 文件系统 = 硬盘存文件的规则，Linux 用 ext4 <!-- .element: class="fragment" -->
- 内容存数据块，元信息存 inode <!-- .element: class="fragment" -->
- inode 不存文件名，文件名是"标签" <!-- .element: class="fragment" -->
- 分区要挂到目录（挂载点）才能用 <!-- .element: class="fragment" -->

**作业**：回答"inode 和文件名是什么关系"。

Note: 今天小结四点。文件系统是硬盘存文件的规则，Linux 用 ext4；文件内容存数据块，元信息存 inode；inode 不存文件名，文件名只是标签；分区要挂到目录上才能用。作业回答 inode 和文件名的关系。下节课我们深入学 ls 和文件类型。
