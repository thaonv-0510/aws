resource "aws_iam_role" "role-s3" {
  name = "role-s3"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "policy-s3" {
  name = "policy-s3"
  role = aws_iam_role.role-s3.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*"
        ]
        Effect   = "Allow"
        Resource = aws_s3_bucket.bucket-role.arn
      }
    ]
  })
}

resource "aws_iam_instance_profile" "instance-profile-1" {
  name = "role-profile-s3"
  role = aws_iam_role.role-s3.name
}
