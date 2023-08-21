import "mod"

config {
  provider = "awssdk"
  version  = "latest"
}

data "external" "aws_cost_data" {
  program = ["sh", "get_cost_data.sh"]
}

select
  resource_id,
  cost_type,
  usage_start_date,
  usage_end_date,
  diff(cost_amount) as cost_change_percentage
from
  aws_cost_data
where
  usage_start_date > now() - interval '6 months'
  and cost_type in ('AmazonGuardDuty', 'AmazonInspector')
