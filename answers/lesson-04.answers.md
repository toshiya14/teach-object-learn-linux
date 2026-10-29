# 第 04 课 · 实验答案

## 实验 A 参考答案

| 命令 | pwd 输出 | ls 常见内容 |
| --- | --- | --- |
| `cd /` | `/` | `bin boot dev etc home lib media mnt opt proc root run sbin srv sys tmp usr var` |
| `cd /etc` | `/etc` | 大量 `.conf` 文件，如 `passwd`、`hostname`、`apt/` |
| `cd /usr` | `/usr` | `bin lib share local include` |
| `cd /var` | `/var` | `log cache lib tmp` |
| `cd /tmp` | `/tmp` | 可能为空或少量临时文件 |

## 实验 B 参考答案

- `cd ..` 从 `/tmp` 回到 `/`。
- 在 `/` 时再 `cd ..`，`pwd` 仍显示 `/`（根目录没有上一级）。

## 实验 C 参考答案

- `cd ~` 后 `pwd` 输出：`/home/你的用户名`。
- `ls .` 列出家目录内容（桌面、文档、下载等）。
- `cd ..` 从家目录上到 `/home`，`pwd` 输出：`/home`。

## 常见疑问

**Q：`cd /etc` 和 `cd etc` 有什么区别？**
A：`/etc` 是绝对路径，从根目录出发，无论在哪都能到达 `/etc`。`etc` 是相对路径，指"当前目录下的 etc 子目录"，如果你当前目录下没有 etc，就会报错。

**Q：`~` 和 `/home/你的用户名` 是一回事吗？**
A：是的，`~` 就是当前用户家目录的简写，展开后等于 `/home/你的用户名`。

**Q：为什么我在 `/` 下 `cd ..` 还在 `/`？**
A：根目录是文件系统的最顶层，没有上一级，所以 `..` 在 `/` 处就等于 `/` 本身。
