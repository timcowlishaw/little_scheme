require 'little_scheme/s_expression'
module LittleScheme
  class Number < SExpression
    def initialize(value)
      @value = value
    end

    def atom?
      true
    end

    def eq?
      raise "Can't eq a number"
    end

    attr_reader :value
  end
end
