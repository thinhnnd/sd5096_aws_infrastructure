variable "AWS_ACCESS_KEY" {
  type = string
}
variable "AWS_SECRET_KEY" {
  type = string
}
variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-southeast-1 = "ami-091a58610910a87a9",
    us-east-1      = "ami-08a52ddb321b32a8c"
  }
}