resource "aws_key_pair" "practical_devops_keypair" {
  key_name   = "PracticalDevOps"
  public_key = file("keys/practical_devops_keypair.pub")

}