resource "aws_eip" "myname" {
  tags = {
    Name = "${var.user-name}-eip"
  }
}
resource "aws_instance" "myname" {
  ami           = "ami-0a0ff88d0f3f85a14"
  depends_on = [ aws_eip.myname ]
  instance_type = "t3.micro"
  tags = {
    Name = "${var.ins-name}-instance"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "${var.user-name}-bucket"
  depends_on = [ aws_instance.myname ]
}

output "s3id" {
  value = aws_s3_bucket.name.id
}

variable "buck-name" {
  default = "buck-var-k21"
}

variable "user-name" {
  description = "Enter your User Name"
  default = "king-kong"
}

variable "ins-name" {
  default = "ins-k211"
}


