class CreateBaseTables < ActiveRecord::Migration

  # TODO : not sure if this was the right way to go ...

  #def self.up
  #  create_table :backfire_control_params do |t|
  #    t.string  :name, :limit => 50, :null => false
  #    t.string  :description, :limit => 200
  #    t.string  :rulechain_option, :limit => 1, null => false, :default => "B"
  #    t.integer :runaway_limit,  :null => false, :default => 20
  #    t.string  :log_option, :limit => 1, :null => false, :default => "Y"
  #    t.integer :lock_version
  #    t.timestamps
  #  end
  #
  #  create_table :backfire_rules do |t|
  #    t.string :name, :limit => 50, null => false
  #    t.string  :description, :limit => 200
  #    t.string :assertion, :limit => 2000, null => false
  #    t.string :fact, :limit => 30, null => false
  #    t.string :predicate, :limit => 2000, null => false
  #    t.integer :lock_version
  #    t.timestamps
  #  end
  #
  #  create tale backfire_queries do |t|
  #    t.string :name, :limit => 50, null => false
  #    t.string :description, :limit => 200
  #    t.string :expression, :limit => 2000, :null => false
  #    t.integer lock_version
  #    t.timestamps
  #  end
  #
  #end
  #
  #def self.down
  #  drop table :backfire_rules
  #  drop table :backfire_queries
  #  drop_table :backfire_control_params
  #end


end
