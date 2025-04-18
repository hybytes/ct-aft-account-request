company_name = "hybytes"
domain = "hybytes.com"
ct_home_region = "eu-west-1"
tf_backend_secondary_region = "eu-west-1"


# Account Request for "prod account"
module "prod account" {
  source = "../modules/aft-account-request"
  control_tower_parameters = 
  {
    AccountName = "prod account"
    AccountEmail = "hybytes+prod@hybytes.com"
    ManagedOrganizationalUnit = "prodOU"
    SSOUserEmail = "prod@hybytes.com"
    SSOUserFirstName = "prod"
    SSOUserLastName = "hybytes"
  }
#Account Tags here
  account_tags = 
  {
    "hybytes:Owner" = "prod@hybytes.com"
    "hybytes:Environment" = "prod"
    "hybytes:Vended" = "true"
  }


  change_management_parameters = 
  {
    change_requested_by = "hybytes prod"
    change_reason       = "Request account for prod environment"
  }

account_customizations_name  = "prod-customizations"
}# Account Request for "dev account"
module "dev account" {
  source = "../modules/aft-account-request"
  control_tower_parameters = 
  {
    AccountName = "dev account"
    AccountEmail = "hybytes+dev@hybytes.com"
    ManagedOrganizationalUnit = "devOU"
    SSOUserEmail = "dev@hybytes.com"
    SSOUserFirstName = "dev"
    SSOUserLastName = "hybytes"
  }
#Account Tags here
  account_tags = 
  {
    "hybytes:Owner" = "dev@hybytes.com"
    "hybytes:Environment" = "dev"
    "hybytes:Vended" = "true"
  }


  change_management_parameters = 
  {
    change_requested_by = "hybytes dev"
    change_reason       = "Request account for dev environment"
  }

account_customizations_name  = "dev-customizations"
}

