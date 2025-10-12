# resource "aws_instance" "prod" {
#   # ami           = "ami-0c02fb55956c7d316"
#   instance_type = "t3.small"

#   tags = {
#     Name        = "prod-sffinstance"
#     Environment = "product2ion"
#   }
# }

# resource "aws_security_group" "prod" {
#   name_prefix = "prod-sg"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.0.0/8"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
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
#     Environment = "production"
#   }
# }
