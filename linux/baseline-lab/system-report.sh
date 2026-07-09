#!/usr/bin/env bash

echo "=== Linux System Report ==="
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Current directory: $(pwd)"
echo "Date: $(date)"
echo
echo "Disk usage:"
df -h /
