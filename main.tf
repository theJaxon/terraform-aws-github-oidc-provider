data "aws_caller_identity" "current_caller_identity" {}

resource "aws_resourcegroups_group" "resourcegroups_group" {
  name        = "${var.project_name}-group"
  description = "Resources created via aws-${var.project_name} module."
  resource_query {
    query = <<JSON
      {
        "ResourceTypeFilters": [ "AWS::AllSupported" ],
        "TagFilters": [{
        "Key": "ResourceGroup",
        "Values": ["${var.project_name}"]}]
      }
    JSON
  }
}

resource "aws_iam_openid_connect_provider" "github" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1",
    "1c58a3a8518e8759bf075b76b750d4f2df264fcd"
  ]
  tags = {
    ResourceGroup = "${var.project_name}"
  }
}

locals {
  github_repository = "${var.github_organization_name}/${var.github_repository_name}"
}

resource "aws_iam_role" "github_actions" {
  name = "github_actions"
  assume_role_policy = templatefile("${path.module}/templates/oidc-provider-assume-role-policy.json.tftpl", {
    aws_account_id    = data.aws_caller_identity.current_caller_identity.account_id,
    github_repository = local.github_repository
  })
  tags = {
    ResourceGroup = "${var.project_name}"
  }
}

resource "aws_iam_role_policy_attachment" "github_actions_power_user" {
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}
