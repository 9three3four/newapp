terraform 

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 4.16"
		}
	}
	
	required_version = ">=1.2.0"
}

provider "aws"	{
	region = "us-west-2"
	profile = "sandbox"
}	

resource "aws_instance" "new_server" {
	ami = ""
	instance_type = "t2.micro"

	tags = {
		Name = "Web Server"
	}
}	
