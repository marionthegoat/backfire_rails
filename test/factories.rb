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
      factory :rulebase_with_prompt do
        after :create do |backfire_control|
          FactoryGirl.create :backfire_query, prompt: true, fact: "who_is_hungry", expression: "'who is hungry'", backfire_control: backfire_control
          FactoryGirl.create :backfire_rule, fact: "what_to_buy", assertion: "@who_is_hungry.value == 'CAT'", predicate: "'Milk'", backfire_control: backfire_control
          FactoryGirl.create :backfire_rule, fact: "what_to_buy", assertion: "@who_is_hungry.value == 'DOG'", predicate: "'Steak'", backfire_control: backfire_control
          FactoryGirl.create :backfire_rule, fact: "what_to_buy", assertion: "@who_is_hungry.value == 'BIRD'", predicate: "'Worms'", backfire_control: backfire_control
        end
      end
  end

  factory :backfire_query, class: BackfireQuery do
    sequence(:name) {|n| "QUERY_#{n}"}
    sequence(:description) {|n| "Query #{n}"}
    sequence(:fact) {|n| "fact_#{n}"}
    expression "'Lorem Ipsum'"
    prompt false
    backfire_control
  end

  factory :backfire_rule, class: BackfireRule do
    sequence(:name) {|n| "RULE_#{n}"}
    sequence(:description) {|n| "Rule #{n}"}
    sequence(:fact) {|n| "fact_#{n}"}
    assertion "@activity == 'Imbibio'"
    predicate "'Ergo Sum'"
    backfire_control
  end

end