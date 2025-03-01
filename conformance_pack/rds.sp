locals {
  conformance_pack_rds_common_tags = {
    service = "rds"
  }
}

control "rds_db_instance_backup_enabled" {
  title       = "RDS DB instance backup should be enabled"
  description = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  sql         = query.rds_db_instance_backup_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_instance_encryption_at_rest_enabled" {
  title       = "RDS DB instance encryption at rest should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) instances."
  sql         = query.rds_db_instance_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_instance_multiple_az_enabled" {
  title       = "RDS DB instance multiple az should be enabled"
  description = "Multi-AZ support in Amazon Relational Database Service (Amazon RDS) provides enhanced availability and durability for database instances."
  sql         = query.rds_db_instance_multiple_az_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa             = "true"
    nist_800_53_rev_4 = "true"
    nist_csf          = "true"
  })
}

control "rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instances should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_instance_prohibit_public_access.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_snapshot_encrypted_at_rest" {
  title       = "RDS DB snapshots should be encrypted at rest"
  description = "Ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) snapshots."
  sql         = query.rds_db_snapshot_encrypted_at_rest.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_snapshot_prohibit_public_access" {
  title       = "RDS snapshots should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_snapshot_prohibit_public_access.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_instance_logging_enabled" {
  title       = "Database logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure Amazon Relational Database Service (Amazon RDS) logging is enabled."
  sql         = query.rds_db_instance_logging_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_instance_in_backup_plan" {
  title       = "RDS DB instances should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Relational Database Service (Amazon RDS) instances are a part of an AWS Backup plan."
  sql         = query.rds_db_instance_in_backup_plan.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_instance_and_cluster_enhanced_monitoring_enabled" {
  title       = "RDS DB instance and cluster enhanced monitoring should be enabled"
  description = "Enable Amazon Relational Database Service (Amazon RDS) to help monitor Amazon RDS availability. This provides detailed visibility into the health of your Amazon RDS database instances."
  sql         = query.rds_db_instance_and_cluster_enhanced_monitoring_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf = "true"
  })
}

control "rds_db_instance_deletion_protection_enabled" {
  title       = "RDS DB instances should have deletion protection enabled"
  description = "Ensure Amazon Relational Database Service (Amazon RDS) instances have deletion protection enabled."
  sql         = query.rds_db_instance_deletion_protection_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_800_53_rev_4 = "true"
  })
}