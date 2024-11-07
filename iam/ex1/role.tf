resource "aws_iam_role" "role-s3" {
  name = "role-s3"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "s3.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "instance-profile-1" {
  name = "role-profile-s3"
  role = aws_iam_role.role-s3.name
}
