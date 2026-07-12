# Linux Networking Baseline — Day 3

## What is an IP address?

An IP address is a number assigned to a device on a network so other devices can identify and communicate with it.

Example:
- A private IP address is used inside a local/private network.
- A public IP address is reachable from the internet.

## What is a default route?

A default route is the path network traffic takes when there is no more specific route.

It usually points traffic toward a router, gateway, or internet gateway.

In AWS, a public subnet often has a default route like:

0.0.0.0/0 -> Internet Gateway

## What role does DNS perform?

DNS translates domain names into IP addresses.

Example:
- `aws.amazon.com` is easier for humans to remember.
- DNS helps computers find the IP address behind that domain name.

## What does curl -I return?

`curl -I` returns HTTP or HTTPS response headers from a website.

It can show:
- Status code
- Server response
- Content type
- Security headers
- Cache information

Example:
- `HTTP/2 200` means the website responded successfully.

## What does ss -tuln display?

`ss -tuln` shows listening network sockets.

The flags mean:
- `t` = TCP
- `u` = UDP
- `l` = listening
- `n` = show numbers instead of resolving names

This helps identify which ports are open or listening on the system.

## How is the Codespaces network different from my home computer?

Codespaces runs in a cloud development environment, not directly on my home Wi-Fi network.

My home computer uses my local network and private home IP address.

Codespaces uses GitHub’s cloud environment, so its IP addresses, routes, DNS configuration, and firewall behavior can be different.

Some commands, like `ping`, may be limited or blocked depending on the environment.

## How does this relate to an AWS VPC?

An AWS VPC is a private cloud network.

The same networking ideas apply:
- IP addresses identify resources.
- Routes decide where traffic goes.
- DNS helps resolve names.
- Security rules control what traffic is allowed.
- Some traffic may be blocked even when other traffic works.

This connects to AWS because troubleshooting cloud systems requires understanding networks, routes, DNS, ports, and firewalls.
