#theawsprovider_cloud
provider "aws" {
    region = "us-east-1"
}
#theresourceaws_instance
resource "aws_instance" "ec2_instance" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}