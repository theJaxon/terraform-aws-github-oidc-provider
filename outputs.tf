output "github_repository_url" {
  description = "The URL of the Github repository that will be used for CI."
  value       = "https://github.com/${local.github_repository}.git"
}

output "aws_iam_role_arn" {
  description = "IAM role arn for github actions (To be stored as a secret and referenced as secrets.AWS_IAM_ROLE)"
  value       = aws_iam_role.github_actions.arn
}