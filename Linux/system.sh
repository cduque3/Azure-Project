#!/bin/bash

free -h | grep Mem | awk -F' ' '{print $4}' > ~/backups/freemem/free_mem.txt
df -h | awk -F' ' '{print $3}' > ~/backups/diskuse/disk_usage.txt
lsof /dev/null > ~/backups/openlist/open_list.txt
df -h > ~/backups/freedisk/free_disk.txt
