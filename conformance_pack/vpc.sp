locals {
  conformance_pack_vpc_common_tags = {
    service = "vpc"
  }
}

control "vpc_flow_logs_enabled" {
  title       = "VPC flow logs should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC."
  sql         = query.vpc_flow_logs_enabled.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_igw_attached_to_authorized_vpc" {
  title       = "VPC internet gateways should be attached to authorized vpc"
  description = "Manage access to resources in the AWS Cloud by ensuring that internet gateways are only attached to authorized Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.vpc_igw_attached_to_authorized_vpc.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_security_group_restrict_ingress_tcp_udp_all" {
  title       = "VPC security groups should restrict ingress TCP and UDP access from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) Security Groups."
  sql         = query.vpc_security_group_restrict_ingress_tcp_udp_all.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_security_group_restrict_ingress_common_ports_all" {
  title       = "VPC security groups should restrict ingress access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) security groups."
  sql         = query.vpc_security_group_restrict_ingress_common_ports_all.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_security_group_restrict_ingress_ssh_all" {
  title       = "VPC security groups should restrict ingress SSH access from 0.0.0.0/0"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_ingress_ssh_all.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_default_security_group_restricts_all_traffic" {
  title       = "VPC default security group should not allow inbound and outbound traffic"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) security groups can help in the management of network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_default_security_group_restricts_all_traffic.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_vpn_tunnel_up" {
  title       = "Both VPN tunnels provided by AWS Site-to-Site VPN should be in UP status"
  description = "Redundant Site-to-Site VPN tunnels can be implemented to achieve resilience requirements."
  sql         = query.vpc_vpn_tunnel_up.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "vpc_eip_associated" {
  title       = "VPC EIPs should be associated with an EC2 instance or ENI"
  description = "This rule ensures Elastic IPs allocated to a Amazon Virtual Private Cloud (Amazon VPC) are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances or in-use Elastic Network Interfaces."
  sql         = query.vpc_eip_associated.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}

control "vpc_security_group_associated" {
  title       = "VPC security groups should be associated with at least one ENI"
  description = "This rule ensures the security groups are attached to an Amazon Elastic Compute Cloud (Amazon EC2) instance or to an ENI. This rule helps monitoring unused security groups in the inventory and the management of your environment."
  sql         = query.vpc_security_group_associated.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}
