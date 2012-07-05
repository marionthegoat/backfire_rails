class AltControl   < ActiveRecord::Base
  include BackfireRailsControl
  acts_as_backfire_control :control_rulebase_name_field =>:rulebase_name, :control_rulechain_option_field => :forward_back,
                           :control_runaway_limit_field => :max_iterations, :control_log_output_field => :show_trace
end

# alternate model classes provided to allow testing of overridden attribute/column names
class AltQuery  < ActiveRecord::Base
  include BackfireRailsQuery
  acts_as_backfire_query query_name_field: :query_name, query_expression_field: :query_expression,
                         query_fact_field: :target_fact, query_prompt_field: :prompt_flag
end

class AltRule  < ActiveRecord::Base
  include BackfireRailsRule
  acts_as_backfire_rule :rule_name_field => :rule_name, :rule_assertion_field => :rule_assertion,
                        :rule_fact_field => :target_fact, :rule_predicate_field => :rule_predicate
end