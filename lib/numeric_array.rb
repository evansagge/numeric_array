module NumericArray
  module InstanceMethods
    
    NUMERIC_REGEX = /^-?\d+.?\d*e?-?\d*$/
    
    # Don't require numeric for this Array#sum. ActiveSupport uses it as well: ["foo", "bar"].sum #=> "foobar"
    def sum(identity = 0, &block)
      if block_given?
        map(&block).sum(identity)
      else
        inject { |sum, element| sum + element } || identity
      end
    end

    #  average of an array of numbers
    def average
      check_numeric_array!
      a = numerify
      a.sum / length.to_f
    end
    alias :avg :average
    alias :mean :average

    #  variance of an array of numbers
    def variance(sample = false)
      a = numerify
      avg = a.average
      sum = a.inject(0) { |sum, value| sum + (value - avg) ** 2}
      (1 / (a.length.to_f - (sample ? 1 : 0)) * sum)
    end
    
    def sample_variance
      variance(true)
    end

    #  standard deviation of an array of numbers
    def standard_deviation(sample = false)
      Math.sqrt(self.variance(sample))
    end
    alias :std_dev :standard_deviation
    
    def sample_standard_deviation
      standard_deviation(true)
    end
    alias :sample_std_dev :sample_standard_deviation
    
    def check_numeric_array!
      raise ArgumentError, "Array cannot have the following non-numeric elements: #{non_numeric_elements.collect(&:inspect).join(", ")}" unless numeric_array?
    end
    
    def numeric_array?
      !self.detect{|obj| !(obj.kind_of?(Numeric) or obj.to_s =~ NUMERIC_REGEX) }
    end
    alias :numeric? :numeric_array?
    
    def non_numeric_elements
      self.select{|obj| !(obj.kind_of?(Numeric) or obj.to_s =~ NUMERIC_REGEX)}
    end
    
    def numerify
      self.collect do |obj|
        if obj.kind_of? Numeric
          obj
        elsif obj.to_s =~ NUMERIC_REGEX
          obj.to_f
        else
          raise ArgumentError, "Array element #{obj.inspect} cannot be converted into a numeric value"
        end
      end
    end
    
    def numerify!
      self.replace(numerify)
    end
  end
  
  module ClassMethods
  end    
end

Array.extend NumericArray::ClassMethods
Array.send :include, NumericArray::InstanceMethods