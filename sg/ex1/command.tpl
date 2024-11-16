#!/bin/sh

apt -y install apache2 php unzip &&
systemctl start apache2 &&
cd /var/www/html &&
wget https://us-west-2-aws-training.s3.amazonaws.com/awsu-spl/spl03-working-elb/static/examplefiles-elb.zip &&
unzip examplefiles-elb.zip