# 变量

## 导读

- 等号两侧无空格
- 引号包围变量值
- `read` 读取输入
- `export` 扩大作用域
- `.` 在当前环境执行脚本
- 大括号可以明确声明变量的边界

定义变量时，等号两边不可以有空格，比如：`VAR=value` 可以运行，但是 `VAR = value` 就不可以运行。

[var.sh](./var.sh)

```sh
#!/bin/sh
MY_MESSAGE="Hello World"
echo $MY_MESSAGE
```

注意，`"Hello World"` 需要使用引号包围，因为变量只能包含一个值。

可以使用 `read` 命令动态设定变量，以下脚本会询问你的名字，然后打印出来：

[var2.sh](./var2.sh)

```sh
#!/bin/sh
echo What is your name?
read MY_NAME
echo "Hello $MY_NAME - hope you're well."
```

## 变量的作用域

Bourne shell 的变量无需提前声明。如果你读取一个未定义的变量，会得到一个空字符，没有警告和报错。

`export` 命令对变量作用域的影响很大。为了了解它的运行原理，可以创建如下脚本：

[myvar2.sh](./myvar2.sh)

```sh
#!/bin/sh
echo "MYVAR is: $MYVAR"
MYVAR="hi there"
echo "MYVAR is: $MYVAR"
```

接着运行如下命令：

```sh
$ ./myvar2.sh
MYVAR is:
MYVAR is: hi there
```

因为 `MYVAR` 尚未定义，因此输出空值。当给它赋值，就能输出期望的结果。

如果我们输入如下命令：

```sh
$ MYVAR=hello
$ ./myvar2.sh
MYVAR is:
MYVAR is: hi there
```

依然没有输出，为什么？

当我们在交互窗口执行 `./myvar2.sh` 时，会产生新的 shell 执行该脚本。这与脚本首行的 `#!/bin/sh` 有关。

我们需要使用 `export` 将变量导出，以便被其他命令（包括 shell 脚本）继承。比如：

```sh
$ export MYVAR
$ ./myvar2.sh
MYVAR is: hello
MYVAR is: hi there
```

现在看看脚本第 3 行：就是改变 `MYVAR` 值的行。改变后的数值并不会传递回交互窗口。比如，可以在脚本执行后，读取 `MYVAR` 的值：

```sh
$ echo $MYVAR
hello
```

一旦 shell 脚本退出，它的环境就会被破坏。但 `MYVAR` 会保留交互窗口的值。

为了能在交互窗口接收脚本中设定的值，我们必须 `source` 脚本 - 即在当前环境中执行脚本，而不是创建一个新 shell 环境后，再去执行它。

我们可以使用 `.`（“点”命令）`source` 一个脚本：

```sh
$ MYVAR=hello
$ echo $MYVAR
hello
$ . ./myvar2.sh
MYVAR is: hello
MYVAR is: hi there
$ echo $MYVAR
hi there
```

脚本的改变在当前交互窗口生效了！这也是 `.profile` 和 `.bash_profile` 的运行原理。

另外，有一点值得一提。先看看这个脚本：

```sh
#!/bin/sh
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "I'll create you a file called $USER_NAME_file"
touch $USER_NAME_file
```

考虑一下它的运行结果。比如，我们输入 `steve` 当作 `USER_NAME`，脚本是否会创建 `steve_file` 文件？

答案是不会。除非恰好已经定义 `USER_NAME_file` 变量，否则会导致一个错误。shell 不知道变量名的确切结束位置和后面变量的开始位置。我们怎么定义呢？

解决方案是，使用大括号将变量名包围起来：

[user.sh](./user.sh)

```sh
#!/bin/sh
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "I will create you a file called ${USER_NAME}_file"
touch "${USER_NAME}_file"
```

Shell 脚本现在知道我们在引用 `USER_NAME` 变量，并且增加了 `_file` 后缀。

还要注意 `"${USER_NAME}_file"` 周围的双引号 - 假如用户输入了 `"Steve Parker"`（注意中间的空格），如果没使用引号，那么 `touch` 命令接收的将是 `Steve` 和 `Parker_file` 两个参数，即我们实际运行的是 `touch Steve Parker_file`，这会创建两个文件，而不是我们期望的一个。引号会避免这个错误。

## 预置变量

有些变量已经为你提前定义，你不能改变它们的值，但可以直接使用。

它们包含有用信息，可以在脚本中使用，用来判断脚本所处的环境信息。

```
```

（未完待续。。。）

## REF

- [Variables - Part 1][var1], by *Steve Parker*
- [Variables - Part 2][var2], by *Steve Parker*

[var1]: https://www.shellscript.sh/variables1.html
[var2]: https://www.shellscript.sh/variables2.html