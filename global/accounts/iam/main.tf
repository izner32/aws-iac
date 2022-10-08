/**
  Overview: 
   * create group
   * create user
     * attach programmatic access
     * attach to group
   * create role 
   * create identity-based policy
     * attach identity-based policy or aws-managed policy (predefined) to identity (user / group / role / etc.)
*/

# create groups 
module "iam_group_with_policies" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"

  name = "superadmins"

  group_users = [
    "superadmin-ecr",
    "superadmin-eks"
  ]

  attach_iam_self_management_policy = true

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]

  custom_group_policies = [
    {
      name   = "AllowS3Listing"
      policy = data.aws_iam_policy_document.sample.json
    }
  ]
}