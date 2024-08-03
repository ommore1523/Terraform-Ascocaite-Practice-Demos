Quetions:

What is provisioners:
    - provisioners can be used to model specific actions on local machines or remote machiner in order to prepare servers.

Mention some Use cases:
    - passing data into virtual machines
    - running configuration management software like chef or ansible
    
What are the types of provisioners as per time of definition:
    - Creation time provisioners
    - Destroy time provisioners

What are the failure behaviours ?
    - Continue : Ignore error and continue
    - Faile : Raise and error (Default)

What are the different type of provisioner:
    - file provisioner
    - remote-exec provisioner
    - local-exec provisioner

What is self. object?


File Provisioner:
    - Used to copy files or directories from the machine executing terraform to the newly created resource
    - It supports both ssh and winrm type of connection
