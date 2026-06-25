data  "aws_ami" "linux"{
    most_recent = true
    owners = ["amazon"]
    filter {

      name = "name"
      values = ["Deep Learning OSS Nvidia Driver AMI GPU PyTorch 2.3.1 (Ubuntu 20.04) 20241117"]
    }


}
resource "aws_instance" "vm" {
    ami = data.aws_ami.linux.id
    instance_type = "t3.micro"

    tags = {
        Name = "vm02"

    }
}

output "ami_id" {

    value = data.aws_ami.linux.id  
}