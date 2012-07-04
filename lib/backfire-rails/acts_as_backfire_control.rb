require 'backfire'
include Backfire::Model

module BackfireRailsControl

  RULECHAIN_OPTION_LOV = { B: "Back-Chaining", L: "Limited-Forward", F: "Forward-Chaining"}

  def self.included(base)
    base.send :extend, BackfireRailsControlClassMethods
  end
end

module BackfireRailsControlClassMethods
  # any method placed here will apply to classes
  def acts_as_backfire_control(options = {})
    cattr_accessor :control_rulebase_name_field, :control_rulechain_option_field, :control_runaway_limit_field, :control_log_output_field
    self.control_rulebase_name_field = (options[:control_rulebase_name_field] || :name).to_s
    self.control_rulechain_option_field = (options[:control_rulechain_option_field] || :rulechain_option).to_s
    self.control_runaway_limit_field =  (options[:control_runaway_limit_field] || :runaway_limit).to_s
    self.control_log_output_field = (options[ :control_log_output_field] || :log_output).to_s
    send :include, BackfireRailsControlInstanceMethods
  end
end

module BackfireRailsControlInstanceMethods

  include Backfire::Model
  include Backfire::Exceptions

  def before_save
    raise BackfireException, "Rulebase name must be specified." if self.rulebase_name.nil?
    raise BackfireException, "Rulechain option must be specified." if self.rulechain_option.nil?
    raise BackfireException, "Runaway limit must be specified." if self.runaway_limit.nil?
    raise BackfireException, "Log output option must be specified." if self.log_output.nil?
    raise BackfireException, "Log output option must be 'Y' or 'N'" unless [ControlParam::OPTION_YES,ControlParam::OPTION_NO].include?(self.log_output)
    raise BackfireException, "Rulechain option must be 'B','L', or 'F'" \
      unless [ControlParam::BACKCHAIN_ONLY,ControlParam::LIMITED_FORWARD,ControlParam::FORWARD].include?(self.rulechain_option)
    raise BackfireException, "Runaway limit must be integer between 1 and 99999" unless self.runaway_limit <= 99999 && self.runaway_limit >= 1
  end

  def rulebase_name
    return read_attribute(self.control_rulebase_name_field)
  end

  def rulebase_name=(name)
    write_attribute(self.control_rulebase_name_field,name)
  end

  def rulechain_option
    return read_attribute(self.control_rulechain_option_field)
  end

  def rulechain_option=(opt)
    write_attribute(self.control_rulechain_option_field,opt)
  end

  def rulechain_option_desc
    BackfireRailsControl::RULECHAIN_OPTION_LOV[self.rulechain_option.to_sym]
  end

  def runaway_limit
    return read_attribute(self.control_runaway_limit_field)
  end

  def runaway_limit=(val)
    write_attribute(self.control_runaway_limit_field,val)
  end

  def log_output
      return read_attribute(self.control_log_output_field)
  end

  def log_output=(opt)
    write_attribute(self.control_log_output_field, opt)
  end

  def control_instance
    return ControlParam.new(self.rulebase_name, self.rulechain_option, self.runaway_limit, self.log_output)
  end
  
end
