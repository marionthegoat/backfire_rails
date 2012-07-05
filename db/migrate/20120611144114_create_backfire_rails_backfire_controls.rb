class CreateBackfireRailsBackfireControls < ActiveRecord::Migration
  def change
    create_table :backfire_rails_backfire_controls do |t|
      t.string :name, :null => false
      t.string :description
      t.string :rulechain_option, :null => false
      t.integer :runaway_limit, :null => false
      t.string :log_option, :default => true, :null => false
      t.integer :lock_version, :null => false
      t.timestamps
    end
  end
end
