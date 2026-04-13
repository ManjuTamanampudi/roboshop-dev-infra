variable "Project"{
    type = string
    default = "roboshop"
  }

  variable "Environment"{
    type = string
    default = "dev"
  }

   variable "sg_name"{
    type = list
    default = [
          "mongodb", "redis", "mysql", "rabbitmq",
          "catalouge","user","caart","payment","shipping",
          "frontend","backend_alb","frontend_alb",
          "bastion"
    ]
  }