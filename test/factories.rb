include BackfireRails
FactoryGirl.define do
  factory :backfire_control, class: BackfireControl do
      sequence(:name) { |n| "RULE_BASE_#{n}"}
      sequence(:description) {|n| "Rule base number #{n}"}
  end

  factory :backfire_query, class: BackfireQuery do
    sequence(:name) {|n| "QUERY_#{n}"}
    sequence(:description) {|n| "Query #{n}"}
    sequence(:fact) {|n| "fact_#{n}"}
    expression "Lorem Ipsum"
    backfire_control
  end

  factory :backfire_rule, class: BackfireRule do
    sequence(:name) {|n| "RULE_#{n}"}
    sequence(:description) {|n| "Rule #{n}"}
    sequence(:fact) {|n| "fact_#{n}"}
    assertion "Imbibio"
    predicate "ergo Sum"
    backfire_control
  end

end