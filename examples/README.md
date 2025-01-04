# terraform-aws-github-oidc-provider example

This will result in the creation of an IAM role, an OpenIDConnectProvider.

```bash
terraform init
terraform plan
terraform apply
```

### Example outputs
```hcl
aws_iam_role_arn = "arn:aws:iam::<>:role/github_actions"
github_repository_url = "https://github.com/theJaxon/terraform-gitops.git"
```

### Example cleanup
```bash
terraform destroy
```


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github-oidc-provider"></a> [github-oidc-provider](#module\_github-oidc-provider) | ../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_iam_role_arn"></a> [aws\_iam\_role\_arn](#output\_aws\_iam\_role\_arn) | IAM role arn for github actions (To be stored as a secret and referenced as secrets.AWS\_IAM\_ROLE) |
| <a name="output_github_repository_url"></a> [github\_repository\_url](#output\_github\_repository\_url) | The URL of the Github repository that will be used for CI. |
<!-- END_TF_DOCS -->