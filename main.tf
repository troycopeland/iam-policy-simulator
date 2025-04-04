resource "aws_iam_policy" "loose_policy" {
  name        = "OverPermissivePolicy"
  description = "Intentionally broad policy for simulation testing"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:*",
          "ec2:Describe*",
          "ec2:StartInstances",
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}
resource "aws_iam_user" "sim_user" {
  name = "policy-sim-user"
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.sim_user.name
  policy_arn = aws_iam_policy.loose_policy.arn
}