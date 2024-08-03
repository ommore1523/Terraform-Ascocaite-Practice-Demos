Quetions:

1. what is module?
    - Module is container for multiple resources that are used together . Modules consist of collection of tf files
    which kept together in directory.
    - It is way to reuse resource configuration

2. How do you output resource attributes?
   module.module_name.resource_attribute 
   module.ec2_instance.id

3. Can you taint module ? How do you taint resource in module ?
   - No , you cannot taint entire module
   - to taint specific resource, run `terraform state list` for listing out resources and then 
     terraform taint <module.ec2_instance.this[0]>

4. 