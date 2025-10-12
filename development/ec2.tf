# resource "aws_instance" "dev" {
#   ami           = "ami-0c02fb55956c7d316"
#   instance_type = "t3.micro"

#   tags = {
#     Name        = "dev-instance"
#     Environment = "development"
#   }
# }

# resource "aws_security_group" "dev" {
#   name_prefix = "dev-sg"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Environment = "development"
#   }
# }
