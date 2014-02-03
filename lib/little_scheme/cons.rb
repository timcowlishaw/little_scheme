require 'little_scheme/s_expression'
require 'little_scheme/boolean'
module LittleScheme
  class Cons < SExpression
    def initialize(car, cdr)
      @car = car
      @cdr = cdr
    end

    attr_reader :car, :cdr

    def list?
      true
    end

    def atom?
      false
    end

    def null?
      false
    end

    def ==(other)
      other.is_a?(Cons) &&
        self.car == other.car &&
        self.cdr == other.cdr
    end

    def inspect(n=0)
      spaces = "  " * n
      "<LittleScheme::Cons \n#{spaces}  car=#{car.inspect(n+1)}\n#{spaces}  cdr=#{cdr.inspect(n+1)}\n#{spaces}>"
    end

    def hash
      car.hash ^ cdr.hash
    end

    def s_expressions
      [car] + cdr.s_expressions
    end

    def evaluate(environment={})
      car.apply(environment, *cdr.s_expressions.map { |e| e.evaluate(environment) } )
    end
  end
end
