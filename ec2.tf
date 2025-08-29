// ec2 instance code

resource "aws_instance" "server" {
  ami                    = "ami-00ca32bbc84273381"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data              = file("setup.sh")

  tags = {
    Name = "Terraform-project-server"
    env  = "Dev"
  }
}


// ebs volume

resource "aws_ebs_volume" "utc-ebs" {
  availability_zone = aws_instance.server.availability_zone
  size              = 20

  tags = {
    Name = "utc-ebs"
  }
}

resource "aws_volume_attachment" "utc-ebs" {
  instance_id = aws_instance.server.id
  volume_id   = aws_ebs_volume.utc-ebs.id
  device_name = "/dev/sdb"
}