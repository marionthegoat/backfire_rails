module BackfireRails
  class BackfireSession < Backfire::Model::Workspace
    extend ActiveModel::Naming

    attr_accessor :goal_fact
    attr_reader :workspace, :key, :prompt, :control_params
    @@sessions = {}

    def initialize(key, control_params)
      super(control_params.control_instance)
      @@sessions[key] = self # session cache
      @key = key
      @goal_fact = nil
      @control_params = control_params
#      @id = 1 # this is a little funky, we sort out sessions based on cookie, not id.  This is to keep routes happy.
    end

    # @param [Symbol] key
    def self.instance(key, control_params = nil)
      puts "BackfireSession instance, key= #{key.inspect} params=#{control_params.inspect}"
      session = @@sessions[key]
      return session unless session.nil?
      return nil if control_params.nil?
      BackfireSession.new(key, control_params)
    end

    # removes session from cache
    def self.delete (key)
      @@sessions[key] = nil
    end

    def self.model_name # initialize ActiveModel::Naming mixin
      ActiveModel::Name.new(BackfireSession)
    end
    def prompt
      self.current_query.nil? ? nil : self.current_query.expression.resolved_expr
    end

    def load_determinants
      @control_params.backfire_rules.each do |rule|
        add_rule(rule.rule_instance)
      end
      @control_params.backfire_queries.each do |query|
        add_query(query.query_instance)
      end
    end


  end
end