terraform {

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
	
}

# Configure the AWS provider

provider "aws"	{
	region = "us-west-2"
	profile = "sandbox"
}	
 
# Create an EC2 instance

resource "aws_instance" "new_server" {
	ami = "ami-08f7912c15ca96832"
	instance_type = "t2.micro"

	tags = {
		Name = "Web Server"
	}
}	
