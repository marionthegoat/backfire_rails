include BackfireRails
FactoryGirl.define do

  factory :backfire_control, class: BackfireControl do
      sequence(:name) { |n| "RULE_BASE_#{n}"}
      sequence(:description) {|n| "Rule base number #{n}"}
      factory :backfire_control_with_children do
        after :create do |backfire_control|
          FactoryGirl.create_list :backfire_query, 3, backfire_control: backfire_control
          FactoryGirl.create_list :backfire_rule, 2, backfire_control: backfire_control
        end
      end
  end

  factory :backfire_query, class: BackfireQuery do
    sequence(:name) {|n| "QUERY_#{n}"}
    sequence(:description) {|n| "Query #{n}"}
    sequence(:fact) {|n| "fact_#{n}"}
    expression "Lorem Ipsum"
    prompt false
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