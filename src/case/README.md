# Case 语句

使用 `case` 语句可以节省很多的 `if ... then ... else`，语法简单。

[talk.sh](./talk.sh)

```sh
#!/bin/sh

echo "Please talk to me ..."
while :
do
    read INPUT_STRING
    case $INPUT_STRING in
        hello)
            echo "Hello yourself!"
            ;;
        bye)
            echo "See you again!"
            break
            ;;
        *)
            echo "Sorry, I don't understand"
            ;;
    esac
done
echo
echo "Talk's all folks!"
```

## REF

- [Case][case], by *Steve Parker*

[case]: https://www.shellscript.sh/case.html