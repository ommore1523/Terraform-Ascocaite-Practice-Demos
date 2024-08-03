Quetions:

Explain Below Commands:

1. `terraform show` : show plan.out find in readable format
2. `terraform refresh` : If current resources someone modified from console / terraform then refresh command will get that changes into state file
3. `terraform state list` : list the terraform resources from state file or from current state
4. `terraform state show aws_instance.demo1_ec2_instance` : show conf of specific resource

5. `terraform mv` : ignore 
6. `terraform rm` : ignore
7. `terraform replace` : ignore

8. `terraform state pull` : manullay download an show the resources from remote backend on *console*
9. `terraform state pull` : manually push the state file from local to remote

10. `terraform force-unlock <lock_id>` : terraform disaster recovery concepy

11. `terraform taint aws_instance.demo1_ec2_instance`: This is something which forces resource to re creation. terrafom usually attempts update in place or recreation whenere needed (exp.ec2 changes from us-east-1 to ap-south-2)  
     USECASE: - suppose you have created ec2 instance - provide user data with shell script demo.sh
              - as terraform does not consider sh file into changes made and make changes to infra 
              - if you change sh then you need to specify taint 
12. `terraform untaint aws_instance.demo1_ec2_instance`
             


13. `terraform plan -target= aws_instance.demo1_ec2_instance`/`terraform apply -target= aws_instance.demo1_ec2_instance`
    - apply to specific resource the it will be helpful

