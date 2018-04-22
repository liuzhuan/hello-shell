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

另一个有用的技巧是 `while read f` 循环。下面的例子使用了 `case` 语句，从 `myfile` 中读取文件。

[while3a.sh](./while3a.sh)

```sh
#!/bin/sh
while read f
do
    case $f in
        hello)          echo English                ;;
        howdy)          echo American               ;;
        gday)           echo Australian             ;;
        bonjour)        echo Frech                  ;;
        "guten tag")    echo German                 ;;
        *)              echo Unkown Language: $f    ;;
    esac
done < myfile
```

在许多 Unix 系统中，也可以写成：

[while3b.sh](./while3b.sh)

```sh
#!/bin/sh
while f=`line`
do
    ... process f ...
done < myfile
```

由于 `while read f` 可以在任意 *nix 中运行，无需依赖外部程序 `line`，第一个写法更可取。

Bash 的另一个小技巧是：

```sh
$ mkdir rc{0,1,2,3,4,5,6,S}.d
```

它也可以被递归调用：

```sh
$ ls -ld {,usr,usr/local}/{bin,sbin,lib}
```

## REF

- [loops][loops], by *Steve Parker*

[loops]: https://www.shellscript.sh/loops.html