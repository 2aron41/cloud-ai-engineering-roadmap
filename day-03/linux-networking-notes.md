# Linux Networking Notes — Day 3

## Commands Practiced

- `pwd` shows the current directory.
- `ls` lists files and folders.
- `mkdir -p` creates folders, including parent folders if needed.
- `cd` changes directories.
- `touch` creates empty files.
- `hostname` shows the computer/network name.
- `whoami` shows the current logged-in user.
- `ifconfig` shows network interface information on macOS.
- `ping` tests network connectivity using ICMP packets.
- `curl -I` checks HTTP/HTTPS response headers from a website.

## My System Output

Hostname:

Aarons-MacBook-Air.local

User:

aaronntim-gyakari

Active network interface:

en0

Private IP address:

10.0.1.11

## What I Learned

My Mac is connected through the `en0` network interface.

My private IP address is `10.0.1.11`, which means my device is on a local private network.

The `ping amazon.com` command failed with 100% packet loss. This does not always mean the internet is down because some networks or websites block ICMP ping traffic.

The `curl -I https://aws.amazon.com` command worked and returned `HTTP/2 200`, which means the AWS website responded successfully over HTTPS.

## Important Difference

`ping` tests ICMP network traffic.

`curl` tests web traffic using HTTP or HTTPS.

A website can fail ping but still work in a browser or through curl.

## Cloud Connection

This connects to AWS networking because cloud engineers need to understand the difference between network reachability and application reachability.

A server, website, or AWS service might block ping but still allow HTTPS traffic.

For AWS, this matters when troubleshooting:

- VPCs
- Subnets
- Route tables
- Internet Gateways
- Security Groups
- NACLs
