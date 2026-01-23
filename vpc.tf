provider "aws" {
    region = "us-east-1"
}
#thevpc
resource "aws_vpc" "main_vpc" {
    cidr_block ="10.0.0.0/16"
}
#thepublicsubnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}
#theprivatesubnets
resource "aws_subnet" "private_subnet" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1a"
}
resource "aws_instance" "ec2_public" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_instance" "ec2_private" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.private_subnet.id
}


// ...existing code...

output "public_instance_ip" {
    value       = aws_instance.ec2_public.public_ip
    description = "Public IP of the public instance"
}

output "private_instance_ip" {
    value       = aws_instance.ec2_private.private_ip
    description = "Private IP of the private instance"
}

output "public_instance_public_dns" {
    value       = aws_instance.ec2_public.public_dns
    description = "Public DNS of the public instance"
}