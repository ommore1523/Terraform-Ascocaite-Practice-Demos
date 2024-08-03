/*


1. VPC:
    name: om-vpc
    cidr: 10.0.0.0
    tag: Name=om-vpc
2. SUBNET-1
    name: om-subnet-pub
    avz: ap-south-1a
    cidr: 10.0.0.0/26
    tag: Name=om-subnet-pub

3. Key-Pair -manual
    name: om-keypair

4. Security Group:
    name: om-pub-sg
    description: allow_ssh_icmp
    vpc: om-vpc
    inbount_rule: ssh, tcp, 22 , anywhere:0.0.0.0/0
    outbound_rule: all traffic

5. EC2 instance
    Name: om-ec2-pub
    ami: ami-0ad21ae1d0696ad58
    instance_type: t2.micro
    vpc: om-vpc
    subnet: om-subnet-pub
    auto-assign-pub-ip: true
    sg: op-pub-sg
    key_pari = om-keypair


6. Route Table:
    name: om-pub-rt
    vpc: om-vpc
    tags: Name: om-pub-rt

7. Subnet Ascociation:
    name: om-subnet-pub

8. Internet Gateway:
    name: om-igw
    

9. Attach IGW:
    vpc: om-vpc

10. Edit Route:
     dest: 0.0.0.0
     src: igw 
*/
p-south-1a
    cidr: 10.0.0.0/26
    tag: Name=om-subnet-pub

3. Key-Pair -manual
    name: om-keypair

4. Security Group:
    name: om-pub-sg
    description: allow_ssh_icmp
    vpc: om-vpc
    inbount_rule: ssh, tcp, 22 , anywhere:0.0.0.0/0
    outbound_rule: all traffic

5. EC2 instance
    Name: om-ec2-pub
    ami: ami-0ad21ae1d0696ad58
    instance_type: t2.micro
    vpc: om-vpc
    subnet: om-subnet-pub
    auto-assign-pub-ip: true
    sg: op-pub-sg

6. Route Table:
    name: om-pub-rt
    vpc: om-vpc
    tags: Name: om-pub-rt

7. Subnet Ascociation:
    name: om-subnet-pub

8. Internet Gateway:
    name: om-igw
    
9. Attach IGW:
    vpc: om-vpc

10. Edit Route:
     dest: 0.0.0.0
     src: igw 
*/
