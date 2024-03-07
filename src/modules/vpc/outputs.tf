output "vpc" {
	value = module.vpc
}

output "sg_public_id" {
	value = aws_security_group.allow_ssh_pub.id
}

output "sg_private_id" {
	value = aws_security_group.allow_ssh_priv.id
}
