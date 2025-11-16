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
  bucket = "byck"
  depends_on = [ aws_instance.myname ]
  tags = {
    Name = "byck"
  }
}

output "s3id" {
  value = aws_s3_bucket.name.id
}

variable "buck-name" {
  default = "buck-var-k21"
}

variable "user-name" {
  default = ""
}

variable "ins-name" {
  default = "ins-k211"
}


