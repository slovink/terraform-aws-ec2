##----------------------------------------------------------------------------------
## Terraform module to create instance module on AWS.
##----------------------------------------------------------------------------------
module "ec2" {
  source      = "./../../"
  name        = "ec2-yada"
  environment = "test"

  ##----------------------------------------------------------------------------------
  ## Below A security group controls the traffic that is allowed to reach and leave the resources that it is associated with.
  ##----------------------------------------------------------------------------------
  #tfsec:aws-ec2-no-public-ingress-sgr
  vpc_id            = ""
  ssh_allowed_ip    = ["0.0.0.0/0"]
  ssh_allowed_ports = [22]

  #instance
  instance_count = 1
  ami            = "ami-xxxxxxxxxx"
  instance_type  = "t2.micro"

  #Networking
  subnet_ids = ["subnet-xxxxxxxxxxx"]

  #Keypair
  public_key = "ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx vinod@vinod"

  #IAM
  iam_instance_profile = "ami-xxxxxxxxxxx"

  #Root Volume
  root_block_device = [
    {
      volume_type           = "gp2"
      volume_size           = 15
      delete_on_termination = true
    }
  ]
  #Tags
  instance_tags = { "snapshot" = true }

}
