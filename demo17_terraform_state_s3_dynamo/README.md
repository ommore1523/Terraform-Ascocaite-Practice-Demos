Quetions:

why state file in s3?
    Multiple team members cannot the infrastructure as they dont have access to state file. So terraform backend uses the s3 storage for state files.
    
what is terraform state locking ? why its needed ?
    - if two members are running terraform at same time you may face the race condition as multiple terraform processes make concurrent updates to the state files leading to conflict , data loss and state file corruption
    - Not all backends allow state locking only s3 allows
    - terraform will not continue if locking fails
    - we can disable state locking but not recommended
    - also we can force unlock the state lock



