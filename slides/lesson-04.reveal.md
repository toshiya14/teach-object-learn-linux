# 目录结构（FHS）与路径

## 第 04 课 · 30 分钟

Note: 大家好，前几课我们装好了系统、认识了内核。这一课我们正式走进 Linux 的目录，看看根目录下每个文件夹都是干什么的，再学会怎么用路径在系统里自由穿梭。这是以后天天要用的基本功。

---

# 本节课你会学到

- 根目录与常用目录 <!-- .element: class="fragment" -->
- 绝对路径 vs 相对路径 <!-- .element: class="fragment" -->
- cd 与 pwd 的熟练使用 <!-- .element: class="fragment" -->
- 特殊符号 ~ . .. <!-- .element: class="fragment" -->

Note: 这节课四个目标。第一，认识根目录和几个常用目录；第二，分清绝对路径和相对路径；第三，熟练使用 cd 和 pwd；第四，掌握波浪号、点、两个点这三个特殊符号。

---

# Linux 文件系统是一棵树

- 根目录是 `/` <!-- .element: class="fragment" -->
- 一切从根长出来 <!-- .element: class="fragment" -->
- FHS 约定"什么目录放什么" <!-- .element: class="fragment" -->

```
/
├─ home   用户家目录
├─ etc    配置文件
├─ var    变化的数据
├─ usr    系统软件
├─ bin    基本命令
└─ tmp    临时文件
```

Note: Linux 的文件系统是一棵树，最顶上是根目录，写作一个斜杠。所有的文件、目录都从它长出来。这套"什么目录放什么"的约定有个标准叫 FHS。记住一句话：一切从根开始。

---

# 常用目录逐个看

- /home —— 每个人的"私人房间" <!-- .element: class="fragment" -->
- /etc —— 总开关面板（配置） <!-- .element: class="fragment" -->
- /var —— 储物间（日志等） <!-- .element: class="fragment" -->
- /usr —— 主仓库（软件） <!-- .element: class="fragment" -->
- /bin —— 工具箱（基本命令） <!-- .element: class="fragment" -->
- /tmp —— 临时垃圾桶 <!-- .element: class="fragment" -->

Note: 这几个目录最好都记住。home 是每个用户的家，放个人文件；etc 放配置文件，像总开关面板；var 放会变化的数据，比如日志；usr 放系统软件；bin 放最基本命令；tmp 放临时文件。

---

# 绝对路径 vs 相对路径

- 绝对路径：从根 `/` 开始写 <!-- .element: class="fragment" -->
- 相对路径：从当前位置开始写 <!-- .element: class="fragment" -->
- 判断方法：开头是不是 `/` <!-- .element: class="fragment" -->
- 比喻：从火车站出发 vs 从我这儿出发 <!-- .element: class="fragment" -->

```
绝对路径  /home/你的用户名/文档
相对路径  文档
          （相对当前目录）
```

Note: 路径分两种。绝对路径从根斜杠开始写，比如 home 你的用户名 文档，不管你在哪都指向同一个地方。相对路径从你当前位置开始写，比如直接写"文档"。怎么判断？看开头是不是斜杠，是就是绝对路径。

---

# 三个特殊符号

- `~` = 我的家目录 <!-- .element: class="fragment" -->
- `.` = 当前目录 <!-- .element: class="fragment" -->
- `..` = 上一级目录 <!-- .element: class="fragment" -->
- 比喻：我家 / 我脚下 / 上一层楼 <!-- .element: class="fragment" -->

```bash
cd ~      # 回家
ls .      # 看当前目录
cd ..     # 上一层
```

Note: 三个特殊符号要牢记。波浪号代表我的家目录，点代表当前目录，两个点代表上一级。就像我家、我脚下、上一层楼。配合 cd 和 ls 用起来非常方便。

---

# 命令演示 1：我在哪 + 绝对路径

- pwd 看当前位置 <!-- .element: class="fragment" -->
- cd /etc 用绝对路径跳转 <!-- .element: class="fragment" -->
- 再 pwd 确认 <!-- .element: class="fragment" -->

```bash
pwd
cd /etc
pwd
```

- 输出：先显示家目录，再显示 `/etc` <!-- .element: class="fragment" -->

Note: 先输入 pwd 看自己在哪，一般在 home 你的用户名。然后 cd 斜杠 etc，这是绝对路径，直接跳到根目录下的 etc。再 pwd 确认，现在显示 etc。绝对路径的好处是，不管你在哪都能直达。

---

# 命令演示 2：相对路径

- cd .. 表示上一级 <!-- .element: class="fragment" -->
- 从 /etc 上去一级到 / <!-- .element: class="fragment" -->
- pwd 确认 <!-- .element: class="fragment" -->

```bash
cd ..
pwd
```

- 输出：`/` <!-- .element: class="fragment" -->

Note: 现在在 etc，输入 cd 两个点，表示上一级，就回到了根目录斜杠。pwd 确认一下，显示一个斜杠。这就是相对路径，它跟你当前的位置有关。

---

# 命令演示 3：回家与查看

- cd ~ 一步到家 <!-- .element: class="fragment" -->
- ls /usr 看 usr 里有什么 <!-- .element: class="fragment" -->

```bash
cd ~
ls /usr
```

- 会看到 bin、lib、share 等子目录 <!-- .element: class="fragment" -->

Note: 输入 cd 波浪号，一步回到你的家目录。再输入 ls 斜杠 usr，看看 usr 这个软件仓库里有什么，你会看到 bin、lib、share 等一堆子目录。

---

# 动手实验（本课任务）

- 实验 A：访问 /、/etc、/usr、/var、/tmp <!-- .element: class="fragment" -->
- 实验 B：用 cd .. 逐级向上回 / <!-- .element: class="fragment" -->
- 实验 C：用 ~ . .. 组合跳转 <!-- .element: class="fragment" -->
- 每到一个目录就 pwd 确认、ls 看看 <!-- .element: class="fragment" -->

Note: 今天三个实验。第一，依次访问根目录、etc、usr、var、tmp，每到一个就 pwd 确认、ls 看看；第二，用 cd 两个点逐级向上回到根；第三，练习用波浪号、点、两个点组合跳转。多走几遍就熟了。

---

# 小结与作业

- 根是 /，目录放什么有 FHS 约定 <!-- .element: class="fragment" -->
- 常用目录：home etc var usr bin tmp <!-- .element: class="fragment" -->
- 绝对路径从 / 开始，相对路径从当前位置 <!-- .element: class="fragment" -->
- ~ 家、. 当前、.. 上一级 <!-- .element: class="fragment" -->

**作业**：画目录树，回答 `cd /etc` 和 `cd etc` 的区别。

Note: 今天小结四点。根是斜杠，目录怎么放有 FHS 约定；常用目录记住 home、etc、var、usr、bin、tmp；绝对路径从根开始，相对路径从当前位置开始；波浪号是家、点是当前、两个点是上一级。作业画一张目录树，并回答 cd 斜杠 etc 和 cd etc 的区别。下节课讲文件到底怎么存在硬盘上。
