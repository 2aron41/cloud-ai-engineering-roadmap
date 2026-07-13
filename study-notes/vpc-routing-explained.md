# VPC Routing Explained

## Public Subnet

What makes a subnet public?

A subnet is public when its route table has a route that sends internet-bound traffic to an Internet Gateway.

Example:

0.0.0.0/0 -> Internet Gateway

This means resources in the subnet can reach the internet if they also have the right public IP address and security rules.

## Private Subnet

What makes a subnet private?

A subnet is private when it does not have a direct route to the internet through an Internet Gateway.

Private subnets are usually used for resources that should not be directly reachable from the internet, such as databases or backend services.

A private subnet can still access the internet indirectly through a NAT Gateway if needed.

## Internet Gateway

What does it do?

An Internet Gateway connects a VPC to the internet.

It allows resources in public subnets to communicate with the internet when the route table and security rules allow it.

## Route Table

What does `0.0.0.0/0 -> Internet Gateway` mean?

`0.0.0.0/0` means all IPv4 traffic that does not match a more specific route.

If the route points to an Internet Gateway, then internet-bound traffic is sent out through the Internet Gateway.

This is what makes a subnet public.

## NAT Gateway

Why might a private subnet need a NAT Gateway?

A private subnet might need a NAT Gateway so resources inside it can reach the internet without allowing the internet to directly reach those resources.

Example:

A private EC2 instance may need to download software updates, but it should not be directly accessible from the internet.

## Security Group vs NACL

Where does each one apply?

Security Group:
- Applies to resources like EC2 instances.
- Stateful.
- Uses allow rules.
- If inbound traffic is allowed, the return traffic is automatically allowed.

NACL:
- Applies at the subnet level.
- Stateless.
- Uses allow and deny rules.
- Inbound and outbound rules must both be configured.

## Interview Explanation

A VPC is like my private network in AWS.

Subnets divide the VPC into smaller network sections.

A public subnet has a route to an Internet Gateway.

A private subnet does not have a direct route to the internet.

Route tables decide where traffic goes.

Security Groups protect resources, while NACLs protect subnets.
