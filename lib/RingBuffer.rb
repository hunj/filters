# RingBuffer, as seen in https://gist.github.com/eerohele/1904422
# RingBuffer is to support the filters with n-values.
# It is a queue of fixed size. When a new element is pushed to a "full" queue, it must "forget" the last

class RingBuffer < Array
  attr_reader :max_size
  
  # Constructor
  def initialize(max_size, enum = nil)
    @max_size = max_size
    enum.each { |e| self << e } if enum
  end
 
  # +push+ method for RingBuffer data structure.
  # Aliased as +<<+
  def <<(el)
    if self.size < @max_size || @max_size.nil?
      super
    else
      self.shift
      self.push(el)
    end
  end
 
  alias :push :<<
end