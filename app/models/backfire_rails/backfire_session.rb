class BackfireSession
  include Backfire::Model
  attr_accessor :goal_fact
  attr_reader :workspace, :key, :prompt
  @@sessions = {}

  def initialize(key, control_params)
    @@sessions[key] = self
    @key = key
    @workspace = Workspace.new(control_params)
    @prompt = nil
    @goal_fact = nil
  end

  # @param [Symbol] key
  def self.instance(key, control_params = nil)
    session = @@sessions[key]
    return session unless session.nil?
    BackfireSession.new(key, control_params)
  end

  def state
    @workspace.state
  end


end