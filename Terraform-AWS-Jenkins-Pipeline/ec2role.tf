resource "aws_iam_role" "test_role" {
  name = "jenkinsec2admin"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
            "Action": "*",
            "Resource": "*"    
}
  ]
}
EOF
}
