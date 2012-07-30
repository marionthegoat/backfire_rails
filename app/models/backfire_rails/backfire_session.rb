module BackfireRails
  class BackfireSession < ActiveRecord::Base
  # This model serves as a wrapper for the workspace, which gets cached in @@sessions
  # browser cookie is used as the key to the cache, and is stored in the session record.
  # this is more or less a poor-man's approach to privatizing the data without implementing user model.
  #
  # We tried inheriting from workspace with ActiveModel mixin, this caused no end of grief with route generation.
  # ActiveModel mizin combined with nested resource in engines seems to be a tozic cocktail
  #
    attr_accessible :session_key, :goal_fact
    @@sessions = {}

    belongs_to :backfire_control

    before_destroy :remove_session

    after_save :update_session


    # @param [Symbol] key
    def self.session_instance(key, backfire_control)
 #     puts "BackfireSession instance, key= #{key.inspect} params=#{control_params.inspect}"
      session = @@sessions[key]
      return session unless session.nil?
      session = Workspace.new(backfire_control.control_instance)
      @@sessions[key] = session
      return session
    end

    def prompt
      self.current_query.nil? ? nil : self.current_query.expression.resolved_expr
    end

    def load_determinants
      self.backfire_control.backfire_rules.each do |rule|
        @workspace.add_rule(rule.rule_instance)
      end
      self.backfire_control.backfire_queries.each do |query|
        @workspace.add_query(query.query_instance)
      end
    end


    def self.has_instance?(key)
      @@sessions.has_key?(key)
    end

    def prompt
      get_session
      @workspace.prompt
    end

    def prompt_response
      @prompt_response
    end

    def prompt_response=(value)
      @prompt_response = value
    end

    def goal_result
      return nil if self.goal_fact.nil?
      get_session
      @workspace.goal_result(self.goal_fact)
    end

    def determinants
      get_session
      @workspace.determinants
    end

    def state
      get_session
      @workspace.state
    end

    def is_awaiting_input?
      get_session
      @workspace.is_awaiting_input?
    end

    def dump
      get_session
      @workspace.dump
    end

    private

    def get_session
     if @workspace.nil?
        @workspace = BackfireSession.session_instance(self.session_key, self.backfire_control)
        load_determinants
     end
    end

    def remove_session
      @@sessions.delete(self.session_key)
    end

    def update_session
      return if self.goal_fact.nil?
      get_session
      @workspace.prompt_response = self.prompt_response if @workspace.state == Workspace::STATE_PROMPT
      @workspace.solve(self.goal_fact)
  end


  end
end