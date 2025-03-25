module "environment_account" {
  for_each = { for env in var.environments : env.name => env }
    source = "./modules/aft-account-request"
    control_tower_parameters = {
      AccountEmail             = "${each.value.company}+${each.value.name}@${each.value.domain}"
      AccountName              = "${each.value.name} account"
      ManagedOrganizationalUnit = each.value.environment_managed_ou
      SSOUserEmail             = "${each.value.company}+${each.value.name}@${each.value.domain}"
      SSOUserFirstName         = each.value.F_user
      SSOUserLastName          = each.value.L_user
    }

    account_tags = {
      "${each.value.company}:Owner"       = "${each.value.company}+${each.value.name}@${each.value.domain}"
      "${each.value.company}:Environment" = each.value.name
      "${each.value.company}:Vended"      = "true"
    }

    change_management_parameters = {
      change_requested_by = "${each.value.company} ${each.value.name}"
      change_reason       = "Request account for ${each.value.name} environment"
    }

    account_customizations_name = "${each.value.name}-customizations"
}
