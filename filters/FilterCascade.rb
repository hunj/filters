require './filters/Filter.rb'
require './lib/Resettable.rb'

# A Filter just stores input values, just to demonstrate the outline of generic Filter.
# Filter#output will give out its input history array
class FilterCascade < Filter
  include Resettable
  attr_reader :data, :filters

  # generates a list of filters as well
  def initialize(n=nil)
    super(n)
    @filters = []
  end

  # Adds a filter to filters list 
  # +input_filter+ - the filter to add to FilterCascade's filters list
  def add_filter(input_filter)
    unless input_filter.is_a? Filter
      raise FilterException::InvalidArgumentError.new("Only Filter type can be added to FilterCascade. (got: #{input_filter.class})")
    end

    @filters << input_filter
  end

  # runs each filter on the input
  # +input_data+ - the data to feed into FilterCascade
  def output(input_data)
    check_empty_cascade

    input(input_data)
    
    cascade_input = input_data
    @filters.each do |filter|
      cascade_input = filter.output(cascade_input)
    end
    return cascade_input
  end

  # resets the filter: each filter's +reset+ method will be called.
  # However, if a filter does not support +reset+ and thus raises +NoMethodError+, those +NoMethodError+s are rescued and logged to warn user.
  def reset
    begin
      @filters.each do |filter|
        filter.reset
      end
    rescue NoMethodError => e
      # logs the backtrace to warn user
      p e.backtrace
    end
  end

  private
  # checks if current filter cascade is empty (no filters added)
  # if so, raises exception
  def check_empty_cascade
    if @filters.empty?
      raise FilterException::EmptyFilterCascadeError.new("Filter Cascade is empty.")
    end
  end

end