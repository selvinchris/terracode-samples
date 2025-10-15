module "instance1" {
  source = "./dev"
  ami    = var.ami
  inst-type = var.inst-type
}