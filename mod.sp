benchmark "aws_top_10" {
  title       = "AWS Top 10"
  description = "Controls relevant to the top 10 security items."

  children = [
    benchmark.accurate_account_info,
    benchmark.use_mfa,
    benchmark.no_secrets,
    benchmark.limit_security_groups,
    benchmark.intentional_data_policies,
    benchmark.centralize_cloudtrail_logs,
    benchmark.validate_iam_roles,
    benchmark.take_action_on_findings,
    benchmark.rotate_keys
  ]

}

benchmark "accurate_account_info" {
  title = "1. Accurate account information"
  children = [
  ]
}

benchmark "use_mfa" {
  title = "2. Use multi-factor authentication (MFA)"
  children = [
    aws_compliance.control.iam_root_user_mfa_enabled,
    aws_compliance.control.iam_user_mfa_enabled,
    aws_compliance.control.iam_user_console_access_mfa_enabled,
  ]
}
