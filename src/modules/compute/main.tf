// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" ec2_public{
	ami = data.aws_ami.amazon-linux-2.id
	associate_public_ip = true
	instance_type = "t2.micro"
	key_name = var.key_name
	subnet_id = var.vpc.public_subnets[0]
	vpc_security_group_ids = [var.sg_public_id]
}

tags = {
	"Name" = "${var.namespace}-ec2-public"
}

# copy ssh key file to home dir

provisioner "file" {
	source = "./${var.key_name}.pem"
	destination = "/home/ec2-user/${var.key_name}.pem"


	connection {
		type = "ssh"
		user = "ec2-user"
		private_key = file("${var.key_name}.pem")
		host = self.public_ip
	}	
}

provisioner "remote-exec" {
	inline = ["chmod 400 ~/${var.key_name}.pem"]


	connection {
		type = "ssh"
		user = "ec2-user"
		private_key = file("${var.key_name}.pem")
		host = self.public_ip
	}	
}


# install nignx

provisioner "file" {
	source = "/Users/chandrakanth/nginx_install.sh"
	destination = "/tmp/nginx_install.sh"

	connection {
		type = "ssh"
		user = "ec2-user"
		private_key = file("${var.key_name}.pem")
		host = self.public_ip
	}	
}

provisioner "file" {
	source = "/Users/chandrakanth/nginx_install.sh"
	destination = "/tmp/nginx_install.sh"

	connection {
		type = "ssh"
		user = "ec2-user"
		private_key = file("${var.key_name}.pem")
		host = self.public_ip
	}	
}

// Configure the EC2 instance in private subnet

resource "aws_instance" "ec2_private" {
	ami = 
	associate_public_ip_address = false
	instance_type = "t2.micro"
	key_name = var.key_name
	subnet_id = var.vpc.private_subnets[1]
	vpc_security_group_ids = [var.sg_priv_id]

	tags = {
		"Name" = "${var.namespace}-ec2_private"
	}
}
