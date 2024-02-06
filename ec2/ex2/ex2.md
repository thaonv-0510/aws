### EC2 với EC2 instance connect endpoint

#### ssh command
```bash
    ssh -i "key-1.pem" ubuntu@<instance_id> -o ProxyCommand='aws ec2-instance-connect open-tunnel --instance-id <instance_id>'
```
