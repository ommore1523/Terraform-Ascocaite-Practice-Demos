Quetions:

What is terraform workspace ?
    - you can call it as temporary workspace in order to freely experiement without affecting the default workspaces.
    - a commong use case for multiple workspaces to create a parallel distinct copy of set of infrastructure before modifying 
      the main production infrastructure.
    - Terraform will not recommend this for larger infrastructre instead we can use SVN


Commands:
    - terraform workspace show
    - terraform workspace list
    - terraform workspace new
    - terraform workspace select
    - terraform workspace delete