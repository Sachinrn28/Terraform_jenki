variable "dynamic" {
  description = "Creating multiple instance with different name and iam id in same region"
  type = map(object({
    instance_type = string
    ami           = string
    name          = string
  }))
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-0453ec754f44f9a4a", name = "shivam" }
    instance2 = { instance_type = "t2.micro", ami = "ami-0866a3c8686eaeeba", name = "shakthi" }
  }
}

