# 桌面环境、快照与虚拟机管理

## 第 03 课 · 30 分钟

Note: 大家好，上一课我们认识了内核和 Shell。这一课换个轻松的话题：你每天看到的桌面到底是什么，还有虚拟机最好用的功能——快照，也就是"存档点"。学会打快照，你以后做实验就再也不怕弄坏系统了。

---

# 本节课你会学到

- 桌面环境的组成 <!-- .element: class="fragment" -->
- 什么是快照 <!-- .element: class="fragment" -->
- 打快照与恢复快照 <!-- .element: class="fragment" -->
- 软件源与系统更新 <!-- .element: class="fragment" -->
- sudo 与 apt 命令 <!-- .element: class="fragment" -->

Note: 这节课五个目标。第一，了解桌面环境；第二，理解快照是什么；第三，学会打快照和恢复快照；第四，认识软件源和系统更新；第五，会用 sudo 和 apt 完成第一次更新。

---

# 桌面环境是什么

- 比喻：手机的"面子"，系统是"里子" <!-- .element: class="fragment" -->
- Ubuntu 默认桌面叫 GNOME <!-- .element: class="fragment" -->
- 负责画出窗口、任务栏、图标 <!-- .element: class="fragment" -->
- 可更换，换完底层系统不变 <!-- .element: class="fragment" -->

```
桌面环境（GNOME）
┌──────────────────┐
│  窗口  图标  任务栏 │  ← 你看到的
└──────────────────┘
        内核 / 命令行  ← 真正干活
```

Note: 桌面环境就像手机的"面子"，你看到的主屏幕、图标、壁纸都是它画的。Ubuntu 默认用 GNOME 这个桌面环境。它只是最外层的一层皮，可以换成 KDE 之类，换完底层系统一点不变。记住，真正干活的是内核和命令行。

---

# 快照是什么

- 比喻：游戏存档点 <!-- .element: class="fragment" -->
- 记录虚拟机某一时刻的完整状态 <!-- .element: class="fragment" -->
- 乱来之后能"读档"回到那一刻 <!-- .element: class="fragment" -->
- 实验的"后悔药" <!-- .element: class="fragment" -->

```
  打快照            乱操作          恢复快照
   ●─────────────────X───────────────▶ ●
（存档）          （玩坏了）        （读档回到存档）
```

Note: 快照，说白了就是游戏存档点。它能记录虚拟机某一时刻的完整状态，包括系统文件、设置、装好的软件。之后不管你怎么折腾，都能读档回到存档那一刻。这是你学习 Linux 最好的后悔药，建议每次做有风险的操作前都先存档。

---

# 打快照与恢复快照

- 打快照：在 NanaBox 里点"快照/保存状态" <!-- .element: class="fragment" -->
- 恢复快照：点"恢复"回到之前 <!-- .element: class="fragment" -->
- 建议：操作前打，出问题就恢复 <!-- .element: class="fragment" -->
- 快照很省空间，多打几个没关系 <!-- .element: class="fragment" -->

```
新建快照 → 命名（如"装好系统"）→ 确认
实验失败 → 恢复快照 → 回到干净状态
```

Note: 具体操作很简单。在 NanaBox 里找到快照或者保存状态的按钮，给当前状态命个名，比如"刚装好系统"，确认就行。以后想回到这个状态，点恢复即可。快照很省空间，可以多打几个。

---

# 软件源是什么

- 比喻：应用商店 / 软件仓库 <!-- .element: class="fragment" -->
- 软件包：打包好的软件 <!-- .element: class="fragment" -->
- 软件源：存放软件包的仓库地址 <!-- .element: class="fragment" -->
- Ubuntu 官方源、国内镜像源 <!-- .element: class="fragment" -->

```
软件源（仓库）
├─ 浏览器包
├─ 编辑器包
├─ 游戏包
└─ ... 成千上万个
```

Note: 软件源就像手机的应用商店。Linux 里的软件都被打包成标准格式，叫软件包，统一放在一个仓库里，这个仓库就是软件源。Ubuntu 有官方源，也有国内镜像源，速度更快。我们装软件就是从这些仓库里取。

---

# 系统更新分两步

- `apt update`：刷新仓库清单（不装东西） <!-- .element: class="fragment" -->
- `apt upgrade`：按清单升级软件（真正安装） <!-- .element: class="fragment" -->
- 比喻：先查"有什么新货"，再"下单购买" <!-- .element: class="fragment" -->

```bash
sudo apt update     # 第一步：刷新清单
sudo apt upgrade    # 第二步：真正升级
```

Note: 系统更新分两步，千万别搞混。第一步 apt update，只是去仓库拉取最新的软件清单，告诉你有什么新版本，但不装任何东西。第二步 apt upgrade，才真正下载并升级。就像先查商店有什么新货，再决定下单。

---

# sudo 是什么

- 比喻：管理员口令 <!-- .element: class="fragment" -->
- sudo = superuser do <!-- .element: class="fragment" -->
- 普通用户改系统、装软件要加 sudo <!-- .element: class="fragment" -->
- 输密码时不显示字符，属正常 <!-- .element: class="fragment" -->

```bash
sudo apt update
      └─ 以管理员身份执行
```

Note: 有些操作只有管理员能做，普通用户要做时，得在前面加 sudo，表示"以管理员身份执行"。sudo 是 superuser do 的缩写。注意，输入密码时屏幕上一个字都不显示，这是正常的，别以为键盘坏了，直接输完回车就行。

---

# 命令演示 1：刷新清单

- 先联网，再运行 <!-- .element: class="fragment" -->
- 只更新清单，安全 <!-- .element: class="fragment" -->

```bash
sudo apt update
```

- 会滚动显示"正在读取软件包列表…" <!-- .element: class="fragment" -->

Note: 现在动手第一次更新。先确保虚拟机联网，然后输入 sudo apt update，回车，输入密码。屏幕会滚动显示正在读取软件包列表，最后告诉你读了多少个包。记住，这一步只更新清单，非常安全。

---

# 命令演示 2：升级软件

- 按清单升级已装软件 <!-- .element: class="fragment" -->
- 会问你是否继续，输入 y <!-- .element: class="fragment" -->
- ⚠️ 耗时较长，期间勿断电、勿关闭 <!-- .element: class="fragment" -->

```bash
sudo apt upgrade
```

- 建议升级前先打快照 <!-- .element: class="fragment" -->

Note: 第二步是 sudo apt upgrade，它会真正下载并升级软件，会先列出要升级哪些、占多少空间，问你确不确认，输入 y 回车继续。这里要特别注意，升级耗时较长，中途千万别断电别关机。稳妥起见，升级前先打一个快照。

---

# 动手实验（本课任务）

- 实验 A：认识 GNOME 桌面 <!-- .element: class="fragment" -->
- 实验 B：打第一个快照 <!-- .element: class="fragment" -->
- 实验 C：运行 sudo apt update（可选 upgrade） <!-- .element: class="fragment" -->
- 提示：升级前先快照 <!-- .element: class="fragment" -->

Note: 今天三个实验。第一，熟悉 GNOME 桌面，找到应用列表、设置、文件管理器；第二，给虚拟机打第一个快照；第三，运行 sudo apt update，有时间和网速的话再做 upgrade。记住，升级前先打快照。

---

# 小结与作业

- 桌面环境只是"壳"，可更换 <!-- .element: class="fragment" -->
- 快照 = 存档点，实验的后悔药 <!-- .element: class="fragment" -->
- update 刷新清单，upgrade 真正升级 <!-- .element: class="fragment" -->
- sudo = 以管理员身份执行 <!-- .element: class="fragment" -->

**作业**：完成实验 A/B/C，回答 update 和 upgrade 的区别。

Note: 今天小结四点。桌面环境只是壳，可以换；快照是存档点，是实验的后悔药；update 只刷新清单，upgrade 才真正升级；sudo 表示以管理员身份执行。作业完成三个实验，并回答 update 和 upgrade 的区别。下节课我们正式逛 Linux 的目录结构。
