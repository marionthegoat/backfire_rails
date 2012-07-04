module BackfireRails
  class BackfireControl < ActiveRecord::Base
    include BackfireRailsControl
    attr_accessible :description, :lock_version, :log_output, :name, :rulechain_option, :runaway_limit, :timestamps
    acts_as_backfire_control

    has_many :backfire_queries, :class_name => 'BackfireRails::BackfireQuery', :dependent => :destroy
    has_many :backfire_rules, :class_name => 'BackfireRails::BackfireRule', :dependent => :destroy

    validates_presence_of :name

    before_save :defaults, :upcases

    def log_option_boolean
      return true if self.log_output == "Y"
      false
    end

    private

      def defaults
        self.rulechain_option = "B" if self.rulechain_option.nil?
        self.log_output = "Y" if self.log_output.nil?
        self.runaway_limit = 20 if self.runaway_limit.nil?
      end

      def upcases
        self.name.upcase!
        self.log_output.upcase!
        self.rulechain_option.upcase!
      end

  end
end
