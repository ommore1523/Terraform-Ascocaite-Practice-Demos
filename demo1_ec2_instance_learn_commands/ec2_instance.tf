/*
Quetions:

Terraform INIT
    What is the purpose of the terraform init command?
        terraform init initializes a Terraform working directory by preparing the backend, installing necessary plugins, and setting up the working environment.

    What happens if you run terraform init in an existing Terraform project?
        Running terraform init in an existing project will reinitialize the backend, install any new plugins, and ensure the working directory is up-to-date.

    How can you specify a specific backend configuration during initialization?
        You can specify a backend configuration using the -backend-config option, like so: terraform init -backend-config=path/to/config.

    Can you explain what happens during the plugin installation phase of terraform init?
        Terraform downloads and installs the necessary provider plugins required to manage the infrastructure defined in the configuration files.

Terraform validate

    What does the terraform validate command do?
        terraform validate checks the syntax and internal consistency of the Terraform configuration files without interacting with any remote services.

    How does terraform validate differ from terraform plan?
        terraform validate only checks the configuration for syntactical correctness, while terraform plan goes further to create an execution plan by comparing the configuration with the remote state.

    What kinds of errors can terraform validate help identify?
        terraform validate can help identify syntax errors, missing required arguments, and other basic configuration issues.

    What is the outcome of a successful terraform validate command?
        The outcome is a message indicating that the configuration is valid. No changes are made to the infrastructure.

Terraform plan

    What is the purpose of the terraform plan command?
        terraform plan creates an execution plan, showing what actions Terraform will take to achieve the desired state described in the configuration files.

    How can you save the output of terraform plan to a file?
        You can save the plan to a file using the -out option, like so: terraform plan -out=plan.out.

    What are some scenarios where running terraform plan is particularly useful?
        Running terraform plan is useful for previewing changes before applying them, debugging configuration changes, and reviewing the impact of the changes with stakeholders.

    Can you explain the difference between terraform plan and terraform apply?
        terraform plan only creates a plan showing what changes will be made, while terraform apply executes the changes and applies them to the infrastructure.

Terraform apply

    What does the terraform apply command do?
        terraform apply applies the changes required to reach the desired state of the configuration, as outlined in the execution plan.

    How can you apply a previously saved plan file using terraform apply?
        You can apply a previously saved plan file using the -input option, like so: terraform apply plan.out.

    What are the risks of running terraform apply without first running terraform plan?
        Running terraform apply without a prior plan can result in unexpected changes being applied, as the user won't have a chance to review the planned changes.

    How can you make terraform apply run non-interactively?
        You can run terraform apply non-interactively using the -auto-approve flag, like so: terraform apply -auto-approve.

Terraform destroy

    What is the purpose of the terraform destroy command?
        terraform destroy is used to delete all the resources managed by the Terraform configuration.

    How can you ensure that terraform destroy runs without requiring confirmation?
        You can ensure non-interactive execution using the -auto-approve flag, like so: terraform destroy -auto-approve.

    In what situations might you use terraform destroy?
        terraform destroy is used in situations where you need to tear down an environment, clean up resources at the end of a project, or perform a fresh deployment.

    How does Terraform ensure that resources are destroyed in the correct order?
        Terraform uses dependency information specified in the configuration files to determine the correct order for destroying resources, ensuring that dependencies are handled correctly.

    What is the role of the -target flag with the terraform destroy command?

        Role of -target: The -target flag allows you to specify a particular resource or set of resources to be destroyed without affecting the rest of the infrastructure. This can be useful for selective clean-up operations.

    How to delete protected resource?
        update disable_api_termination = false this proerty from true to false and destroy 
*/


resource "aws_instance" "demo1_ec2_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    tags = {
      Name = "ec2_tf_demo1"
    }
}