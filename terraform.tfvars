bucket_name = "dev-proj-1-terraform-remote-state-bucket-123456"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-jenkins-ap-southeast-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["ap-southeast-1a", "ap-southeast-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCs/mn3eREm4mvAqldTUUPkWi6V4uAOQA1rkTkiMTwgp6m4FTAOBGiV4ca7Xqgduf/cOkWsDCkM86wRnedg65GfR6TYhdnPA0BgzQeVi4/QzZodKQR2JuHOJqTXGvU50MlU2Kvzjv/Mu1CvluLK63tzfdOuVMQnm1ZNyyk9tZCNM/Lji0kixTtYU/fbVybQC/hdn4bzm7XEhjQeAodpgPId0aGEu+ZVNxBBjQNZbHPNA+Q701WLuwRsqyOKO6p3Kp7sowe+tCZDjnKsAtVOJtz1Yl0Fh6veyi4IEne5fttvmJM4H0dEoWSqA2q9jrsN6bh4cNij7aqWrRab3DNqbOOvNT2hl+X9qHhnfJT8OhWR7FTKt3XKvUzZ3viph6Kr4ItpU4OnrdI1ivp2cOwM78QpA2j4kSsoX43faYnoelKL/upNmGhuJpcoQTVgP1Mo16rU5kbZ1aWTATUXrUSGT31MXnhqYYyykONMajil8hGVnzi5dEt7YPI4Twv6CPAAQ0c= nassermaronie@Nassers-MacBook-Pro.local"
ec2_ami_id = "ami-0497a974f8d5dcef8"

domain_name = "shadowghosts.xyz"
endpoint_name = "dev-proj-1.shadowghosts.xyz"