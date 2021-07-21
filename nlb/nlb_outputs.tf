output "nlb_dns_name" {
  value = aws_lb.aws_nlb_final.dns_name
}

output "nlb_target_group_arn" {
  value = aws_lb_target_group.cc_target_group_final.arn
}
