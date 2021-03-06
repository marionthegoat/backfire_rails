BackfireRails::Engine.routes.draw do
  resources :backfire_controls do
    resources :backfire_queries, :name_prefix => "rulebase_"
    resources :backfire_rules, :name_prefix => "rulebase_"
    resources :backfire_sessions
  end
  resources :backfire_queries, :backfire_rules, :backfire_sessions

  post '/backfire_controls/:backfire_control_id/backfire_sessions/:id', :controller => 'backfire_rails/backfire_sessions', :action => 'create'
  get '/backfire_controls/:backfire_control_id/backfire_sessions/:id', :controller => 'backfire_rails/backfire_sessions', :action => 'show'


end
