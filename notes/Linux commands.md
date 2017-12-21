Linux commands
@linux @bash

### Find file from iNode Number
```
find ~/ -inum 123456
```
### Start GUI app in background from commandline
```
<guiapp> . &!
```

### Run last command as root
```
sudo !!
```

### Serve current dir tree at :8080
Only in python2
```
python -m SimpleHTTPServer
```

Python3:
```
python3 -m http.server


### Replacing in last command
```
^sub^to
```

### Supervise command (run every 2s)
```
watch "ls -larth"
```

### Kill program using one port

```bash
sudo fuser -k 8000/tcp
```

### Limit memory usage for following commands

``` 
ulimit -Sv 1000       # 1000 KBs = 1 MB
ulimit -Sv unlimited  # Remove limit 
```

### Rename selected files using a regular expression

```
rename 's/\.bak$/.txt/' *.bak
```

### Get full path of file

```
readlink -f file.txt
```

### List contents of tar.gz and extract only one file

```
tar tf file.tgz
tar xf file.tgz filename }}
```

### List files by size

```
ls -lS
```

### Nice trace route

```
mtr google.com
```

### Find files tips

``` 
find . -size 20c             # By file size (20 bytes)
find . -name "*.gz" -delete  # Delete files
find . -exec echo {} \;      # One file by line
./file1
./file2
./file3
find . -exec echo {} \+      # All in the same line
./file1 ./file2 ./file3
```

### Print text ad infinitum

```
yes
yes hello
```

### Who is logged in?

```
w
```

### Prepend line number

```
ls | nl
```

### Grep with Perl like syntax (allows chars like \t)

```
grep -P "\t"
```

### Cat backwards (starting from the end)

```
tac file
```

### Check permissions of each directory to a file

It is useful to detect permissions errors, for example when configuring a web server.

```
namei -l /path/to/file.txt
```

### Run command every time a file is modified

```
while inotifywait -e close_write document.tex
do
    make
done
```

### Copy to clipboard

```
cat file.txt | xclip -selection clipboard
```

### Spell and grammar check in Latex

```
detex file.tex | diction -bs
```

You may need to install the following 
sudo apt-get install diction texlive-extra-utils.

### Check resources' usage of command

```
/usr/bin/time -v ls
```

### Randomize lines in file

```
cat file.txt | sort -R
cat file.txt | sort -R | head  # Pick a random sambple
```

### Even better (suggested by xearl in Hacker news):

```
shuf file.txt
```

### Keep program running after leaving SSH session

```
If the program doesn't need any interaction
nohup ./script.sh &
```

If you need to enter some input manually and then want to leave

```
./script.sh
<Type any input you want>
<Ctrl-Z>          # send process to sleep
jobs -l           # find out the job id
disown -h jobid   # disown job
bg                # continue running in the background
```
Of course, you can also use screen or tmux for this purpose.

### Run a command for a limited time

```
timeout 10s ./script.sh
```

### Restart every 30 minutes

```
while true; do timeout 30m ./script.sh; done
```

### Combine lines from two sorted files

```
comm file1 file2
```

### Split long file in files with same number of lines

```
split -l LINES -d file.txt output_prefix
```

### Flush swap partition

If a program eats too much memory, the swap can get filled with the rest of the memory and when you go back to normal, everything is slow. Just restart the swap partition to fix it:
```
sudo swapoff -a
sudo swapon -a
```

### Fix ext4 file system with problems with its superblock

```
sudo fsck.ext4 -f -y /dev/sda1
sudo fsck.ext4 -v /dev/sda1
sudo mke2fs -n /dev/sda1
sudo e2fsck -n <first block number of previous list> /dev/sda1
```

### Create empty file of given size

```
fallocate -l 1G test.img
```

### Manipulate PDFs from the command line

To join, shuffle, select, etc. pdftk is a great tool

```
pdftk *.pdf cat output all.pdf        # Join PDFs together
pdftk A=in.pdf cat A5 output out.pdf  # Extract page from PDF
```

You can also manipulate the content with cpdf

```
cpdf -draft in.pdf -o out.pdf      # Remove images
cpdf -blacktext in.pdf -o out.pdf  # Convert all text to black color
```

### Monitor the progress in terms of generated output

Write random data, encode it in base64 and monitor how fast it
is being sent to /dev/null
```
cat /dev/urandom | base64 | pv -lbri2 > /dev/null
```

