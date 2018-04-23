# sed

The acronym SED stands for Stream EDitor. It is a simple yet powerful utility that parses the text and transforms it seamlessly. SED was developed during 1973–74 by *Lee E. McMahon* of Bell Labs. Today, it runs on all major operating systems.

## Typical Uses of SED

SED can be used in many different ways, such as:

- Text substitution,
- Selective printing of text files,
- In-a-place editing of text files,
- Non-interactive editing of text files, and many more.

## Workflow

In this chapter, we will explore how SED exactly works. To become an expert SED user, one needs to know its internals. SED follows a simple workflow: Read, Execute, and Display. The following diagram depicts the workflow.

- Read: SED reads a line from the input stream (file, pipe, or stdin) and stores it in its internal buffer called **pattern buffer**.

- Execute: All SED commands are applied sequentially on the pattern buffer. By default, SED commands are applied on all lines (globally) unless line addressing is specified.

- Display: Send the (modified) contents to the output stream. After sending the data, the pattern buffer will be empty.

The above process repeats until the file is exhausted.

### Points to Note

- Pattern buffer is a private, in-memory, volatile storage area used by the SED.

- By default, all SED commands are applied on the pattern buffer, hence the input file remains unchanged. GNU SED provides a way to modify the input file in-a-place. We will explore about it in later sections.

- There is another memory area called **hold buffer** which is also private, in-memory, volatile storage area. Data can be stored in a hold buffer for later retrieval. At the end of each cycle, SED removes the contents of the pattern buffer but the contents of the hold buffer remains persistent between SED cycles. However SED commands cannot be directly executed on hold buffer, hence SED allows data movement between the hold buffer and the pattern buffer.

- Initially both pattern and hold buffers are empty.

- If no input files are provided, then SED accepts input from the standard input stream (stdin).

- If address range is not provided by default, then SED operates on each line.

To exit from the SED session, press ctrl-D (^D).

## Basic Syntax

SED can be invoked in the following two forms:

```sh
# -n
#     By default, each line of input is echoed to the standard output after all of the commands have been applied to it.  The -n option suppresses this behavior.

# -e command
#     Append the editing commands specified by the command argument to the list of commands.

# -f command_file
# Append the editing commands found in the file command_file to the list of commands.  The editing commands should each be listed on a separate line.
sed [-n] [-e] 'command(s)' files 
sed [-n] -f scriptfile files
```

The first form allows to specify the commands in-line and they are enclosed within single quotes. The later allows to specify a script file that contains SED commands. However, we can use both forms together multiple times. 

Let us see how we can specify multiple SED commands. SED provides the **delete** command to delete certain lines. Let us delete the 1st, 2nd, and 5th lines. 

```sh
$ sed -e '1d' -e '2d' -e '5d' books.txt
```

Additionally, we can write multiple SED commands in a text file and provide the text file as an argument to SED

```sh
$ echo -e "1d\n2d\n5d" > commands.txt 
$ cat commands.txt
1d
2d
5d
```

```sh
$ sed -f commands.txt books.txt
```

## REF

- [Sed Tutorial - tutorialspoint.com][sed]

[sed]: https://www.tutorialspoint.com/sed/index.htm