# Scalar linear filter is defined by the parameters N, M, a1, a2, ..., aM, b0, b1, ..., bN.
# Where N is # of b-inputs; and M is # of a-inputs.

require './filters/ScalarFilter.rb'

class ScalarLinearFilter < ScalarFilter
  attr_reader :a_arr,       # the a_parameter array
              :b_arr,       # the b_parameter array
              :input_arr,   # the input array
              :output_arr   # the output array

  # Initializes ScalarLinearFilter according to a-parameters and b-parameters
  # +input_a_arr+ - a-parameters array
  # +input_b_arr+ - b-parameters array
  def initialize(input_a_arr, input_b_arr)
    super()

    # Typecheck
    unless input_a_arr.is_a?(Array) or input_b_arr.is_a?(Array)
      raise FilterException::InvalidArgumentError.new("input a_array and b_array must be type Array (Got: #{input_a_arr.class} and #{input_b_arr.class})")
    end

    @a_arr = input_a_arr
    @b_arr = input_b_arr
    @input_arr = []
    @output_arr = []
  end

  # evaluates the new output y_i by calculating parameters
  def output(input_data)
    input(input_data)

    # evaluating y_i :
    # y_i + leftsum = rightsum, where:
    # leftsum  =            a_1(y_i-1) + a_2(y_i-2) + ... + (a_M)(y_i-M) 
    # rightsum = b_0(x_i) + b_1(x_i-1) + b_2(x_i-2) + ... + (b_N)(x_i-N) 
    # so that y_i = rightsum - leftsum.
    
    m_value = @a_arr.length
    n_value = @b_arr.length

    y_arr = find_p_value(m_value, @output_arr)
    leftsum = evaluate_parameter_sum(y_arr, @a_arr)

    x_arr = find_p_value(n_value, @input_arr)
    rightsum = evaluate_parameter_sum(x_arr, @b_arr)

    y_i = rightsum - leftsum

    @output_arr << y_i
    return @output_arr[-1]
  end

  # scalar linear filter can be reset to a value r, 
  # in which case the record of all of previous input values is set to r,
  # and the record of all previous output values is set to r * sum(i=0..N)[b_i] / sum(i=0..M)[a_i]
  # If no reset ever occurred, the missing values are taken to be equal to 0.
  def reset(r)
    check_scalar(r)

    @input_arr = Array.new(@input_arr.length, r)
    @output_arr = Array.new(@output_arr.length, reset_output_default_values(r))

  end

  private
  # used in evaluating leftsum and rightsum (see evaluating y_i in #output)
  def evaluate_parameter_sum(array, parameters)
    sum = 0.0
    length = parameters.length
    
    for count in 0..length
      sum += array[count].to_f * parameters[count] unless array[count].nil? or parameters.reverse[count].nil?
    end

    return sum
  end

  # takes in an array and returns its sum
  def sum_array(array)
    array.inject(:+) || 0
  end

  # returns the new default values for output array for reset function
  def reset_output_default_values(r)
    new_value = r * sum_array(b_arr) / (1.0 + sum_array(a_arr))
    return new_value
  end

  # given an array and its index of p-th value, 
  # calculate that p-th value of the input. (i.e. x_p, y_p)
  def find_p_value(p, array)
    if array.length < p
      return array.reverse # x/y values are multiplied in reverse order
    else
      return array.reverse[0...p]
    end
  end

end