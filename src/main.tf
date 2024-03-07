provider "aws" {
	region = var.region
}

module "networking" {
	source = "./modules/networking"
	namespace = var.namespace
}

module "ssh_key" {
	source = "./modules.ssh-key"
	namespace = var.namespace
}

module "compute" {
	source = "./modules/compute"
	namespace = var.namespace
	vpc = module.networking.vpc
	sg_public_id = module.networking.sg_public_id
	sg_private_id = module.networking.sg_private_
	id
	key_name = module.ssh-key.key_name
}
