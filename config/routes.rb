BackfireRails::Engine.routes.draw do
  resources :backfire_controls do
    resources :backfire_queries, :name_prefix => "rulebase_"
    resources :backfire_rules, :name_prefix => "rulebase_"
    resources :backfire_sessions
  end
  resources :backfire_queries, :backfire_rules
end
