terraform {
    source = "."
}

inputs = {
    permissions_list = [ 
        {
            name = "AdministratorAccess"
            description = "AdministratorAccess"
            session_duration = null
            managed_policies = []
            aws_accounts = []
            sso_groups = []
        },
        {
            name = "ViewOnlyAccess"
            description = "AdministratorAccess"
            session_duration = null
            managed_policies = []
            aws_accounts = []
            sso_groups = []
        }
    ]
}