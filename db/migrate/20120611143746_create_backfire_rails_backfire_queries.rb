class CreateBackfireRailsBackfireQueries < ActiveRecord::Migration
  def change
    create_table :backfire_rails_backfire_queries do |t|
      t.integer :backfire_control_id, :null => false
      t.string :name, :null => false
      t.string :description
      t.text :expression, :null => false
      t.string :fact, :null => false
      t.boolean :prompt, null: false, default: false
      t.integer :lock_version, :null => false
      t.timestamps
    end
  end
end
