# 转义字符

有些字符在 shell 脚本中有特殊含义，比如 `"`, `$` 等。

大部分字符（比如 `*`, `'` 等）在双引号中就不被解释，只是作为字面量而已。比如：

```sh
$ echo *
case.shtml escape.shtml first.shtml 
functions.shtml hints.shtml index.shtml 
ip-primer.txt raid1+0.txt
$ echo *txt
ip-primer.txt raid1+0.txt
$ echo "*"
*
$ echo "*txt"
*txt
```

但是，`"`, `$`, ``` ` ``` 和 `\` 始终会被翻译，即使它们位于双引号之中。

## REF

- [Escape Characters][escape], by *Steve Parker*

[escape]: https://www.shellscript.sh/escape.html