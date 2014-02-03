require 'little_scheme/s_expression'
module LittleScheme
  class Boolean < SExpression
    def initialize(value)
      @value = value
    end

    def atom?
      false
    end

    def list?
      false
    end

    def ==(other)
      other.is_a?(Boolean) && value == other.value
    end

    def hash
      value.hash
    end

    def inspect(n=0)
      "<LittleScheme::Boolean #{value}>"
    end

    def evaluate(environment={})
      self
    end

    attr_reader :value
  end
end
