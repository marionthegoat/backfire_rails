class CreateBackfireRailsBackfireRules < ActiveRecord::Migration
  def change
    create_table :backfire_rails_backfire_rules do |t|
      t.integer :backfire_control_id, :null => false
      t.string :name, :null => false
      t.string :description
      t.text :assertion, :null => false
      t.text :predicate, :null => false
      t.string :fact, :null => false
      t.integer :lock_version, :null => false
      t.timestamps
    end
  end
end
