require 'little_scheme/s_expression'
require 'little_scheme/boolean'
module LittleScheme
  class Null < SExpression
    def atom?
      false
    end

    def list?
      true
    end

    def null?
      true
    end

    def s_expressions
      []
    end

    def evaluate(environment={}, root=true)
      self
    end

    def ==(other)
      other.is_a?(LittleScheme::Null)
    end

    def hash
      self.class.hash
    end

    def inspect(n=0)
      "<LittleScheme::Null>"
    end
  end
end
