module BackfireRails
  class BackfireRule < ActiveRecord::Base
    include BackfireRailsRule
    attr_accessible :assertion, :description, :fact, :lock_version, :name, :predicate, :timestamps
    acts_as_backfire_rule
    belongs_to :backfire_control,  :class_name => 'BackfireRails::BackfireControl'

  end
end
