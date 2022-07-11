locals {
  managed_policies = flatten([
    for permission in var.permission_list : [
      for policy in permission.managed_policies : {
        permission_set_name = permission.name
        policy_arn          = policy
      }
    ]
  ])
  managed_policy_arn = {
    for policy in local.managed_policies :
    "${policy.permission_set_name}_${policy.policy_arn}" => policy
  }

  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.awssso.arns)[0]
  identity_store_id = tolist(data.aws_ssoadmin_instances.awssso.identity_store_ids)[0]

  account_groups = [
    for permission in var.permission_list : [
      for account_groups in setproduct(permission.aws_accounts, permission.sso_groups) : {
        permission_set_name = permission.name
        account             = account_groups[0]
        group               = account_groups[1]
      }
    ]
  ]

  account_group_assignment = {
    for account_group in local.account_groups :
    "${account_group.permission_set_name}.${account_group.account}_${account_group.group}" => account_group
  }

  groups = distinct([for account_group in local.account_groups : account_group.group])
}