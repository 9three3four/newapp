resource "tls_private_key" "key" {
	algorithm = "RSA"
}

resource "local-file" "private_key" {
	filename = "${var.namespace}-key.pem"
	sensitive_content = tls_private_key.key.private_key_pm
	file_permission = "0400"
}

resource "aws_key_pair" "key_pair" {
	key_name = "${var.namespace}-key"
	public_key = tls_private_key.key.public_key_openssh
}
