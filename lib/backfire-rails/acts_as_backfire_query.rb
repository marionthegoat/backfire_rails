# To change this template, choose Tools | Templates
# and open the template in the editor.

module BackfireRailsQuery

  def self.included(base)
    base.send :extend, BackfireRailsQueryClassMethods
  end
end

module BackfireRailsQueryClassMethods
  # any method placed here will apply to classes
  def acts_as_backfire_query(options = {})
    cattr_accessor :query_name_field, :query_expression_field, :query_fact_field, :query_prompt_field
    self.query_name_field = (options[:query_name_field] || :name).to_s
    self.query_expression_field = (options[:query_expression_field] || :expression).to_s
    self.query_fact_field =  (options[:query_fact_field] || :fact).to_s
    self.query_prompt_field = (options[:query_prompt_field] || :prompt).to_s
    send :include, BackfireRailsQueryInstanceMethods
  end
end

module BackfireRailsQueryInstanceMethods

  include Backfire::Model
  include Backfire::Exceptions

  def before_save
    raise BackfireException, "Query name must be specified." if self.query_name.nil?
    raise BackfireException, "Receiving fact must be specified." if self.query_fact_name.nil?
    raise BackfireException, "Query expression be specified." if self.query_expression.nil?
    raise BackfireException, "Query expression contains a command or method which is not allowed" unless BackfireUtils::Sandbox.is_safe?(self.query_expression)
    self.query_prompt = false if self.query_prompt.nil?
  end

  def query_name
    return read_attribute(self.query_name_field)
  end

  def query_name=(name)
    write_attribute(self.query_name_field,name)
  end

  def query_expression
    return read_attribute(self.query_expression_field)
  end

  def query_expression=(expr)
    write_attribute(self.query_expression_field,expr)
  end

  def query_fact_name
    return read_attribute(self.query_fact_field)
  end

  def query_fact_name=(name)
    write_attribute(self.query_fact_field,name)
  end

  def query_prompt
    return read_attribute(self.query_prompt_field)
  end

  def query_prompt=(value)
    write_attribute(self.query_prompt_field, value)
  end

  def query_instance
    @query_instance= Query.new(self.query_name, Expression.parse(self.query_expression), self.query_fact_name, self.query_prompt) if @query_instance.nil?
    @query_instance
  end


end