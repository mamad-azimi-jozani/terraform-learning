variable "access_key" {}
variable "secret_key" {}
# AWS Provider configuration
provider aws {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}


resource "aws_vpc" "development-vpc" {
    cidr_block =  "10.0.0.0/16"
    tags = {
        Name= "development"
        vpc_env= "dev"
    }
  
}

variable "subnet_cidr_block" {
    description = "subnet cidr block"
    default = "10.0.10.0/16"
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-1a"
    tags = {
        Name= "subnet-1-development"
    }
  
}

output "dev-vpc-id" {
    value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
    value = aws_subnet.dev-subnet-1.id
}

