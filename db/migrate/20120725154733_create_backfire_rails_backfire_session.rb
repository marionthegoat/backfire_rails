class CreateBackfireRailsBackfireSession < ActiveRecord::Migration
 def change
   create_table :backfire_rails_backfire_sessions do |t|
     t.integer :backfire_control_id, :null => false
     t.string :session_key, :null => false
     t.string :goal_fact
   end
 end
end
