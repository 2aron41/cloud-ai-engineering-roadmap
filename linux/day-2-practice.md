# Linux and Git Reinforcement — Day 2

## Date

July 10, 2026

## Environment

Ubuntu Linux through GitHub Codespaces

## Linux Commands Practiced

- `pwd`
- `ls -la`
- `touch`
- `echo`
- `cat`
- `grep`
- `find`
- `chmod`
- `whoami`
- `uname -a`
- `ps`
- `df -h`
- `free -h`
- `uptime`

## Git Commands Practiced

- `git status`
- `git log --oneline -5`
- `git diff --stat`

## Files Created

- `linux/day-2-practice/aws.txt`
- `linux/day-2-practice/linux.txt`
- `linux/day-2-practice/notes.txt`

## Permission Practice

I changed `notes.txt` to permission `600`.

Permission `600` means:

- Owner: read and write
- Group: no access
- Others: no access

## What I Learned

- How to create files and add content from the command line
- How to search inside files using `grep`
- How to find files using `find`
- How to change file permissions
- How to inspect processes, disk usage, memory, and uptime
- How to inspect Git status and commit history

## Important Memory Statements

- `grep` searches inside files
- `find` searches for files and directories
- `chmod 600` gives only the owner read and write access
- `git status` shows changed and untracked files
- `git log` shows previous commits
- `git diff --stat` summarizes file changes
