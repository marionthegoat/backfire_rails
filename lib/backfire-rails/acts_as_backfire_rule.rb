module BackfireRailsRule
  def self.included(base)
    base.send :extend, BackfireRailsRuleClassMethods
  end
end

module BackfireRailsRuleClassMethods
  # any method placed here will apply to classes
  def acts_as_backfire_rule(options = {})
    cattr_accessor :rule_name_field, :rule_assertion_field, :rule_fact_field, :rule_predicate_field
    self.rule_name_field = (options[:rule_name_field] || :name).to_s
    self.rule_assertion_field = (options[:rule_assertion_field] || :assertion).to_s
    self.rule_fact_field =  (options[:rule_fact_field] || :fact).to_s
    self.rule_predicate_field =  (options[:rule_predicate_field] || :predicate).to_s
    send :include, BackfireRailsRuleInstanceMethods
  end
end

module BackfireRailsRuleInstanceMethods

  include Backfire::Model
  include Backfire::Exceptions

  def before_save
    raise BackfireException, "Rule name must be specified." if self.rule_name.nil?
    raise BackfireException, "Rule assertion must be specified." if self.rule_assertion.nil?
    raise BackfireException, "Rule predicate must bs specified." if self.rule_predicate.nil?
    raise BackfireException, "Rule assertion contains a command or method which is not allowed" unless BackfireUtils::Sandbox.is_safe?(self.rule_assertion)
    raise BackfireException, "Rule predicate contains a command or method which is not allowed" unless BackfireUtils::Sandbox.is_safe?(self.rule_predicate)
  end

  def  rule_name
    return read_attribute(self.rule_name_field)
  end

  def rule_name=(name)
    write_attribute(self.rule_name_field, name)
  end

  def rule_assertion
    return read_attribute(self.rule_assertion_field)
  end

  def rule_assertion=(expr)
    write_attribute(self.rule_assertion_field, expr)
  end

  def rule_fact_name
    return read_attribute(self.rule_fact_field)
  end

  def rule_fact_name=(name)
    write_attribute(self.rule_fact_field, name)
  end

  def rule_predicate
    read_attribute(self.rule_predicate_field)
  end

  def rule_predicate=(expr)
    write_attribute(self.rule_predicate_field,expr)
  end

  def rule_instance
    @rule_instance=Rule.new(self.rule_name, Expression.parse(self.rule_assertion),
        self.rule_fact_name, Expression.parse(self.rule_predicate)) if @rule_instance.nil?
  end


end