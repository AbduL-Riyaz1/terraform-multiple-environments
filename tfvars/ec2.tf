resource "aws_instance" "expense" {
  count = length(var.instances)
  ami                         = "ami-09c813fb71547fc4f"
  vpc_security_group_ids      = [aws_security_group.allow_tls_1.id]
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-092d2c17ac793a2f6" /* if you don't have default subnet mentoin like this or else no need to give it takes default */
  associate_public_ip_address = true /* if it doesnot show public ip after ceartion of ec2-instance keep this as true */
  /* tags = {
    Name   = var.instances[count.index]
  } */
  tags = merge(
    var.comman_tags,
    {
      Name = "${var.project}-${var.environment}-${var.instances[count.index]}" 
    }
  )# expense-dev-mysql
  
}

resource "aws_security_group" "allow_tls_1" {
  name        = "${var.project}-${var.environment}"   #expense-dev ,expense-prod
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0a3f89b652495034b" /* if you don't have default vpc mentoin likr this or else no need to give it takes default */

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}"
  }
}