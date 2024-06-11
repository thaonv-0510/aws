## Examle 1
Tạo một custom vpc với 1 public subnet.
#### VPC:
    - CIDR block: 10.0.0.0/6
    - Name tag: lab-architect-vpc
    - DNS Hostname: Yes
    - Tenacy: Default
    - Enable dns hostname
#### Public Subnet a:
    - CIDR Block: 10.0.0.0/20
    - Name tag: lab-architect-public-a
    - VPC: lab-architect-vpc
    - AZ: ap-northeast-1a
    - Auto assign ip: on
#### Public Subnet b:
    - CIDR Block: 10.0.16.0/20
    - Name tag: lab-architect-public-b
    - VPC: lab-architect-vpc
    - AZ: ap-northeast-1c
    - Auto assign ip: on
#### Route table:
    - Name tag: lab-architect-route-public
    - VPC: lab-architect-vpc
    - Subnet: lab-architect-public-a, lab-architect-public-b
#### Internet gateway:
    - Name tag: lab-architect-gateway
    - VPC: lab-architect-vpc
#### Setting Route table:
    - Destiantion: 0.0.0.0/0
    - Target: lab-architect-gateway
#### NACLs:
    - Name tag: lab-architect-acl-public
    - VPC: lab-architect-vpc
    - Subnet association: lab-architect-public-a, lab-architect-public-b
