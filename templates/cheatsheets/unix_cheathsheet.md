# Unix Cheatsheet

## Contents

1. Common Unix Commands
    1. File Operations
    2. File Viewing
    3. File Viewing
    4. Other Use Commands
2. Intermediate-Level Commands
    1. Environment Variable Management
    2. Package Management
    3. Redirection and Piping Operators

---

## 1. Common Unix Commands

Listed below are some of the most common Unix CLI commands you'll come across day to day:

### 1. File Operations

#### Directory Navigation

Unix Command | Description | Example
--- | --- | ---
`cd <folder name>` | Change directory. | `cd example_directory_name`
`mkdir` | Create a new directory. |
`pwd` | Print working directory. |
`cp` | Copy files and directories. | `cp ~/scott.txt ~/myproject/scott.txt`
`mv` | Move or rename files and directories.
`rm` | Remove files and directories.

#### List files and directories

Unix Command | Description | Example
--- | --- | ---
`ls` | List files and directories. | -
`ls -l` | List the files in your current directory, but provide more detail. | -
`ls -la` | Same as `ls -l`, but also list hidden files. | -

### 1.2. File Viewing

Unix Command | Description | Example
--- | --- | ---
`cat` | Display file content. Can also be used to create a new file with redirect operator `>`. | `cat > testcreatenewfile.txt`, `cat existingfile.txt`
`head` | Display the beginning of a file. | `head ~/.bashrc`
`nano` | Simple text editor. | `nano`, `nano ~/scott.txt`

### 1.3. File Permissions

Unix Command | Description | Example
--- | --- | ---
`chmod` | Change file permissions. Note: Some files require special permissions. In general, one should not have to change file permissions. Changing the wrong file accidentally can cause sadness. | `chmod 777 scott.txt`
`chown` | Change file ownership. | -
`sudo` | Elevates permissions for a command. | `sudo apt install build-essential`

### 1.4. Other Useful Commands

Unix Command | Description | Example
--- | --- | ---
`echo` | Sends something to the output buffer or to a file with the redirection command `>`. | `$ echo -e "ubuntu \nis \na \nlinux \ndistribution"`<br>`echo 'bob is your uncle' > uncles.txt`
`touch` | Common uses: can be used to create a new file on the fly or just update the timestamp of an existing file. | `touch test.txt`, `touch existingfile.txt`

---

## 2. Intermediate-Level Commands

Note: I recommend first becoming familiar with the above commands before investigating those described below.

### 2.1. Environment Variable Management

Unix Command | Description | Example
--- | --- | ---
`export` | Sets an environment variable or lists variables similar to the Windows `set` command. | `export TEST='this is a test'`, `echo $TEST`
`source` | Reads and executes contents of a file. For example, if you make changes to a `.bashrc` or `.zshrc` file, the changes won't take effect until a new Linux session or by running `source .zshrc`.

### 2.2. Package Management

Unix Command | Description | Example
--- | --- | ---
`apt` or `apt-get` | APT (Advanced Package Tool) and `apt-get` are both package management command-line tools.  | `apt install git`

### 2.3. Redirection and Piping Operators

Unix Command | Description | Example
--- | --- | ---
`>` | This operator outputs results into the target you specify. The target is usually a filename. You can use this symbol by itself to create a new file. | `echo scott>scott.txt`, `> test2.txt`
`>>` | Redirect output to a file (append if the file exists). | -
`<` | Redirect input from a file. | -
[pipe sybmol here] | Pipe output from one command as input to another command. | -
