with filter_data as (
  select
    trail.account_id,
    trail.name as trail_name,
    trail.is_logging,
    split_part(trail.log_group_arn, ':', 7) as log_group_name,
    filter.name as filter_name,
    action_arn as topic_arn,
    alarm.metric_name,
    alarm.name as alarm_name,
    subscription.subscription_arn,
    filter.filter_pattern
  from
    aws_cloudtrail_trail as trail,
    jsonb_array_elements(trail.event_selectors) as se,
    aws_cloudwatch_log_metric_filter as filter,
    aws_cloudwatch_alarm as alarm,
    jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
    aws_sns_topic_subscription as subscription
  where
    trail.is_multi_region_trail is true
    and trail.is_logging
    and se ->> 'ReadWriteType' = 'All'
    and trail.log_group_arn is not null
    and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
    and filter.filter_pattern ~ '\s*\$\.eventSource\s*=\s*organizations.amazonaws.com.+\$\.eventName\s*=\s*AcceptHandshake.+\$\.eventName\s*=\s*AttachPolicy.+\$\.eventName\s*=\s*CreateAccount.+\$\.eventName\s*=\s*CreateOrganizationalUnit.+\$\.eventName\s*=\s*CreatePolicy.+\$\.eventName\s*=\s*DeclineHandshake.+\$\.eventName\s*=\s*DeleteOrganization.+\$\.eventName\s*=\s*DeleteOrganizationalUnit.+\$\.eventName\s*=\s*DeletePolicy.+\$\.eventName\s*=\s*DetachPolicy.+\$\.eventName\s*=\s*DisablePolicyType.+\$\.eventName\s*=\s*EnablePolicyType.+\$\.eventName\s*=\s*InviteAccountToOrganization.+\$\.eventName\s*=\s*LeaveOrganization.+\$\.eventName\s*=\s*MoveAccount.+\$\.eventName\s*=\s*RemoveAccountFromOrganization.+\$\.eventName\s*=\s*UpdatePolicy.+\$\.eventName\s*=\s*UpdateOrganizationalUnit'
    and alarm.metric_name = filter.metric_transformation_name
    and subscription.topic_arn = action_arn
)
select
  -- Required Columns
  distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
  case
    when f.trail_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when f.trail_name is null then 'No log metric filter and alarm exists for AWS Organizations changes.'
    else filter_name || ' forwards relevant events for AWS Organizations changes.'
  end as reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
  left join filter_data as f on a.account_id = f.account_id
