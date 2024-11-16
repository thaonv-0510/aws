### VPC
    Name Tag:             lab-architect-vpc			
    IPv4 CIDR block:      10.0.0.0/16			
    IPv6 CIDR block:      No IPv6 CIDR Block			
    Tenancy:              Default			
    Enable DNS Hostname:  Yes
### Subnet
    Public Subnet 1
        - Tag:               lab-architect-public-a
        - VPC:               lab-architect-vpc
        - Availability zone: us-east-1a
        - CIDR block:        10.0.0.0/20
        - Auto-assign IPs:   ON
        - Enable Flow Logs:  All
        - Route Table:       lab-architect-route-public
    Public Subnet 2
        - Tag:               lab-architect-public-b
        - VPC:               lab-architect-vpc
        - Availability zone: us-east-1b
        - CIDR block:        10.0.16.0/20
        - Auto-assign IPs:   ON
        - Enable Flow Logs:  All
        - Route Table:       lab-architect-route-public
    Private Subnet 1
        - Tag:               lab-architect-private-a
        - VPC:               lab-architect-vpc
        - Availability zone: us-east-1a
        - CIDR block:        10.0.32.0/20
        - Auto-assign IPs:   none
        - Enable Flow Logs:  All
        - Route Table:       lab-architect-route-private
    Private Subnet 2
        - Tag:               lab-architect-private-b
        - VPC:               lab-architect-vpc
        - Availability zone: us-east-1b
        - CIDR block:        10.0.48.0/20
        - Auto-assign IPs:   none
        - Enable Flow Logs:  All
        - Route Table:       lab-architect-route-private
### Internet gateways
    Name tag:              lab-architect-gateway
    Attach to VPC:         lab-architect-vpc
    Setting Route Table:
        - Destinaton:      0.0.0.0/0			
        - Target	       lab-architect-gateway
### Network ACLs
    Public NACL:
        - Name tag:     lab-architect-acl-public
        - VPC:          lab-architect-vpc
        - Subnet Associations
            - lab-architect-public-a
            - lab-architect-public-b
    Private NACL:
        - Name tag:     lab-architect-acl-private
        - VPC:          lab-architect-vpc
        - Subnet Associations
            - lab-architect-private-a
            - lab-architect-private-b

### EndPoint
    VPC:      lab-architect-vpc
    Service:  com.amazonaws.us-east-1.s3
    Policy:   Full access
    Route Table
        - lab-architect-route-public
        - lab-architect-route-private
### NAT Gateway
    Subnet:                     lab-architect-public-a
    Elastic IP Allocation ID:   Create New EIP
    Route Table:
        - Destinaton:           0.0.0.0/0
        - Target:               NAT Gateway ID