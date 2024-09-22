resource "aws_subnet" "pubsub_1" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = 

  tags = {
    Name = "Main"
  }
}