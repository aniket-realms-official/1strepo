resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.local_vpc_id
  peer_region   = var.peer_region
  auto_accept   = false
  tags = {
    Name = var.vpc_peering_name
  }
}
