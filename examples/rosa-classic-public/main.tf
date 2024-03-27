module "rosa" {
  source = "../../"

  cluster_name          = var.cluster_name
  openshift_version     = var.openshift_version
  create_account_roles  = true
  create_operator_roles = true
  create_oidc           = true
  multi_az              = true
  replicas              = var.replicas
  admin_credentials_username   = "kubeadmin"
  admin_credentials_password   = var.admin_credentials_password
  path                  = "/tf-example/"
  identity_providers = {
    github-idp = {
      name                     = var.idp_name
      idp_type                 = "github"
      github_idp_client_id     = var.github_idp_client_id
      github_idp_client_secret = var.github_idp_client_secret
      github_idp_organizations = jsonencode(var.github_idp_organizations)
    },
  }
}