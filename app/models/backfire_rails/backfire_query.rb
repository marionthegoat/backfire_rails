module BackfireRails
  class BackfireQuery < ActiveRecord::Base
    include BackfireRailsQuery
    attr_accessible :description, :expression, :fact, :lock_version, :name, :prompt, :timestamps
    acts_as_backfire_query

    belongs_to :backfire_control,  :class_name => 'BackfireRails::BackfireControl'

  end
end
