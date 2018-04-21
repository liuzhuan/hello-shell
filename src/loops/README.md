# 循环

在 Bourne Shell 中，循环结构有 `for` 和 `while`。

## For 循环

[for.sh](./for.sh)

```sh
#!/bin/sh
for i in 1 2 3 4 5
do
    echo "Looping ... number $i"
done
```

可以尝试如下代码，猜猜它会输出什么。

[for2.sh](./for2.sh)

```sh
#!/bin/sh
for i in hello 1 * 2 goodbye
do
    echo "Looping ... i is set to $i"
done
```

> 上面的 `*` 会被当作通配符替换为当前目录下的所有文件。

从上面两个列表可以看到，`for` 会简单的遍历列表，直到列表末尾。

## While 循环

`while` 会更有趣！（当然，这取决于你对“有趣”的定义，以及你外出的频率...）

[while.sh](./while.sh)

```sh
#!/bin/sh
INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
    echo "Please type something in (bye to quit)"
    read INPUT_STRING
    echo "You typed: $INPUT_STRING"
done
```

冒号（`:`）始终为真，上面的循环也可以写成如下格式。

[while2.sh](./while2.sh)

```sh
#!/bin/sh
while :
do
    echo "Please type something in (^C to quit)"
    read INPUT_STRING
    echo "You typed: $INPUT_STRING"
done
```

（未完待续。。。）

## REF

- [loops][loops], by *Steve Parker*

[loops]: https://www.shellscript.sh/loops.html