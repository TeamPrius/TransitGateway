# Create Transit Gateway
resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "Transit Gateway connecting On-Prem, Prod and Non-Prod VPCs"
}

# Attach On-Prem VPC to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "on_prem_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.onprem.id
}

# Attach Non-Prod VPC to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "non_prod_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.nonprod.id
}

# Attach Prod VPC to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "prod_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.prod_vpc.id
}
