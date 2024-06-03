common_tags = {
  Project         = "learning"
  Environment     = "nonprod"
  IaC             = true
  IaC_Description = "This resources are created with terraform"
}

vpc_parameters = {
  my_vpc_public = {
    is_public  = true
    cidr_range = "10.0.0.0/27"
    vpc_name   = "public"
  }
  my_vpc_private = {
    is_public  = false
    cidr_range = "10.0.0.32/27"
    vpc_name   = "private"
  }
}

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCEndbOetTudcEDXg2WJRFS72lRVyvO9HmiMik9xeAfhQbo6NwhP5HnDXA2cRyvKaYG3CbOfswL2bFaPSMJTNpet3xE1WMs6yrbgl517TGJ8rPSvJBw1mgCXTdUCAhwVQCRzaWN37BYERFeZFHnN9K4kYRcNx3huFihMyfJ40hds1kBvweTBwdJUzEIKc3gAlWxNDuR1HremFI8LmQjKPMmWDJDOFaGvClB9hBltx7UwMy3wmpyu30FwbO8u0jRdFRwE6OYQy8S42B5gS3kJVUQYxDYNUIAnC5I3Sa//0SwYJiEYgJZsO1OUHt1zIohJIjMLwII8GszvPpgMx1ZYFHx "
key_name   = "my-aws-key"

ec2_parameters = {
  amzlnx2023 = {
    instance_count             = 1
    ami_id                     = "ami-00fa32593b478ad6e"
    instance_type              = "t2.micro"
    server_name                = "amzlnx2023"
    is_public                  = true
  }
}