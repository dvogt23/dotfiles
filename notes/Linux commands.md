Linux commands
@linux @bash

### Run last command as root

```bash sudo !!```

### Serve current dir tree at :8080
Only in python2

```bash python -m SimpleHTTPServer```

Python3:
```bash python3 -m http.server```

### Replacing in last command

```bash ^sub^to```

### Supervise command (run every 2s)

```bash watch "ls -larth"```

### Kill program using one port

```bash sudo fuser -k 8000/tcp```

### Limit memory usage for following commands

```bash ulimit -Sv 1000       # 1000 KBs = 1 MB
ulimit -Sv unlimited  # Remove limit```

### Rename selected files using a regular expression

```bash rename 's/\.bak$/.txt/' *.bak```

### Get full path of file

```bash readlink -f file.txt```

### List contents of tar.gz and extract only one file

```bash tar tf file.tgz
tar xf file.tgz filename }}

### List files by size

```bash ls -lS```

### Nice trace route

```bash mtr google.com```

### Find files tips

```bash find . -size 20c             # By file size (20 bytes)
find . -name "*.gz" -delete  # Delete files
find . -exec echo {} \;      # One file by line
./file1
./file2
./file3
find . -exec echo {} \+      # All in the same line
./file1 ./file2 ./file3```

### Print text ad infinitum

```bash yes
yes hello```

### Who is logged in?

```bash w```

### Prepend line number

```bash ls | nl```

### Grep with Perl like syntax (allows chars like \t)

```bash grep -P "\t"```

### Cat backwards (starting from the end)

```bash tac file```

### Check permissions of each directory to a file

It is useful to detect permissions errors, for example when configuring a web server.

```bash namei -l /path/to/file.txt```

### Run command every time a file is modified

```bash while inotifywait -e close_write document.tex
do
    make
done```

### Copy to clipboard

```bash cat file.txt | xclip -selection clipboard```

### Spell and grammar check in Latex

```bash detex file.tex | diction -bs```

You may need to install the following 
sudo apt-get install diction texlive-extra-utils.

### Check resources' usage of command

```bash /usr/bin/time -v ls```

### Randomize lines in file

```bash cat file.txt | sort -R
cat file.txt | sort -R | head  # Pick a random sambple```

### Even better (suggested by xearl in Hacker news):

```bash shuf file.txt```

### Keep program running after leaving SSH session

```bash If the program doesn't need any interaction
nohup ./script.sh &```

If you need to enter some input manually and then want to leave

```bash
./script.sh
<Type any input you want>
<Ctrl-Z>          # send process to sleep
jobs -l           # find out the job id
disown -h jobid   # disown job
bg                # continue running in the background
```
Of course, you can also use screen or tmux for this purpose.

### Run a command for a limited time

```bash timeout 10s ./script.sh```

### Restart every 30 minutes

```bash while true; do timeout 30m ./script.sh; done```

### Combine lines from two sorted files

```bash comm file1 file2```

### Split long file in files with same number of lines

```bash split -l LINES -d file.txt output_prefix```

### Flush swap partition

If a program eats too much memory, the swap can get filled with the rest of the memory and when you go back to normal, everything is slow. Just restart the swap partition to fix it:
```bash
sudo swapoff -a
sudo swapon -a```

### Fix ext4 file system with problems with its superblock

```bash sudo fsck.ext4 -f -y /dev/sda1
sudo fsck.ext4 -v /dev/sda1
sudo mke2fs -n /dev/sda1
sudo e2fsck -n <first block number of previous list> /dev/sda1```

### Create empty file of given size

```bash fallocate -l 1G test.img```

### Manipulate PDFs from the command line

To join, shuffle, select, etc. pdftk is a great tool

```bash
pdftk *.pdf cat output all.pdf        # Join PDFs together
pdftk A=in.pdf cat A5 output out.pdf  # Extract page from PDF```

You can also manipulate the content with cpdf

```bash
cpdf -draft in.pdf -o out.pdf      # Remove images
cpdf -blacktext in.pdf -o out.pdf  # Convert all text to black color```

### Monitor the progress in terms of generated output

Write random data, encode it in base64 and monitor how fast it
is being sent to /dev/null
```bash cat /dev/urandom | base64 | pv -lbri2 > /dev/null```

