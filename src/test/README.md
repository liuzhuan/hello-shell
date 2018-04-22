# 测试

每个脚本都会用到测试。通常我们不会直接调用 `test`，而是使用 `[`，它是指向 `test` 的一个链接，只是为了让 shell 脚本可读性更好。

```sh
$ type [
[ is a shell builtin
```

这意味着 `[` 是一个程序，需要与其他参数用空格隔离。比如：

```sh
if [ "$foo" = "bar" ]
```

注意：有的 shell 还可以使用 `"=="` 对字符串做对比；这种用法不具有移植性，因此字符串比较时通常使用一个等号 `"="`，整数比较使用 `-eq`。

Test 通常直接在 `if` 或 `while` 语句中调用。语法是 `if ... then ... else ...`。

```sh
if [ ... ]
then
    # if-code
else
    # else-code
fi
```

注意，`fi` 是 `if` 的结束符号。而且要注意，`if [ ... ]` 和 `then` 命令必须位于不同的行。若在同一行，可以使用 `;` 分隔。

```sh
if [ ... ]; then
    # do something
fi
```

你还可以使用 `elif`，就像这样：

```sh
if [ something ]; then
    echo "Something"
    elif [ something_else ]; then
        echo "Something else"
    else
        echo "None of the above"
fi
```

尝试一下如下的脚本：

[test.sh](./test.sh)

```sh
#!/bin/sh
if [ "$X" -lt "0" ]
then
    echo "X is less than zero"
fi
if [ "$X" -gt "0" ]; then
    echo "X is more than zero"
fi
[ "$X" -le "0" ] && \
    echo "X is less than or equal to zero"
[ "$X" -ge "0" ] && \
    echo "X is more than or equal to zero"
[ "$X" = "0" ] && \
    echo "X is the string or number \"0\""
[ "$X" = "hello" ] && \
    echo "X matches the string \"hello\""
[ "$X" != "hello" ] && \
    echo "X is not the string \"hello\""
[ -n "$X" ] && \
    echo "X is of nonzero length"
[ -f "$X" ] && \
    echo "X is the path of a real file" || \
    echo "No such file: $X"
[ -x "$X" ] && \
    echo "X is the path of an executable file"
[ "$X" -nt "/etc/passwd" ] && \
    echo "X is a file which is newer than /etc/passwd"
```

注意上面 `;` 和 `\` 的用法，都可以提高可读性。

`if` 语句有个简写形式：`&&` 和 `||`。

```sh
#!/bin/sh
[ $X -ne 0 ] && echo "X isn't zero" || echo "X is zero"
[ -f $X ] && echo "X is a file" || echo "X is not a file"
[ -n $X ] && echo "X is of non-zero length" || \
    echo "X is of zero length"
```

## REF

- [Test][test], by *Steve Parker*

[test]: https://www.shellscript.sh/test.html