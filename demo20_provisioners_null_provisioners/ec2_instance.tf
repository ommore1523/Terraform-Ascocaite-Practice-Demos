
resource "aws_security_group" "om-pub-sg" {
  name        = "allow_ssh_icmp"
  description = "Allow SSH and ICMP traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere, restrict as needed
  }

  ingress {
    description = "Allow ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere, restrict as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_icmp"
  }
}


resource "aws_instance" "demo1_ec2_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    key_name = "om-keypair"
    vpc_security_group_ids = [aws_security_group.om-pub-sg.id]
    associate_public_ip_address = true

    tags = {
      Name = "ec2_tf_demo"
    }



    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      password = ""
      private_key = file("/home/omkar/Downloads/om-keypair.pem")
    }

  /*
    ---------------------------------------------------------------------
    ------------------ File Provisioner ---------------------------------
    ---------------------------------------------------------------------
  */
    provisioner "file" {
      source = "/home/omkar/Downloads/mail.txt"
      destination = "/tmp/mail.txt"
      on_failure = continue // continue
    }

    # Copies the file-copy.html file to /tmp/file-copy.html
    # provisioner "file" {
    #   source      = "apps/file-copy.html"
    #   destination = "/tmp/file-copy.html"
    # }

    # Copies the string in content into /tmp/file.log
    # provisioner "file" {
    #   content     = "ami used: ${self.ami}" # Understand what is "self"
    #   destination = "/tmp/file.log"
    # }

    # Copies the app1 folder to /tmp - FOLDER COPY
    # provisioner "file" {
    #   source      = "apps/app1"
    #   destination = "/tmp"
    # }

    # Copies all files and folders in apps/app2 to /tmp - CONTENTS of FOLDER WILL BE COPIED
    # provisioner "file" {
    #   source      = "apps/app2/" # when "/" at the end is added - CONTENTS of FOLDER WILL BE COPIED
    #   destination = "/tmp"
    # }

    /*
      ---------------------------------------------------------------------
      ------------------ Remote Executor ---------------------------------
      ---------------------------------------------------------------------
    */

  provisioner "remote-exec" {
    inline = [
      "touch /tmp/remotefile"
    ]
  }



  /*
    ---------------------------------------------------------------------
    ------------------ Local Executor ---------------------------------
    ---------------------------------------------------------------------
  */

  # local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.my-ec2-vm.private_ip} >> creation-time-private-ip.txt"
  #   working_dir = "local-exec-output-files/"
  #   #on_failure = continue
  # }

  # # local-exec provisioner - (Destroy-Time Provisioner - Triggered during Destroy Resource)
  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "echo Destroy-time provisioner Instanace Destroyed at `date` >> destroy-time.txt"
  #   working_dir = "local-exec-output-files/"
  # }  

}


