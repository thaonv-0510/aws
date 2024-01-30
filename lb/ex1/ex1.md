Tạo một load balancer với type là application
#### VPC
  - Sử dụng default VPC

#### Subnet 1-a
  - VPC: default
  - CIDR block: 17.31.48.0/24 (255 IP)
  - name: subnet-1a
  - AZ: ap-northeast-1a
  - public: true

#### Subnet 1-c
  - VPC: default
  - CIDR block: 17.31.56.0/24 (255 IP)
  - name: subnet-1c
  - AZ: ap-northeast-1c
  - public: true

#### Subnet lb
  - VPC: default
  - CIDR block: 17.31.64.0/24 (255 IP)
  - name: subnet-lb
  - AZ: ap-northeast-1a
  - public: true
