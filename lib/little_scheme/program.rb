require 'little_scheme/boolean'
module LittleScheme
  class Program

    BUILT_IN_FUNCTIONS = {
      :car => ->(list) {
        list.car
      },
      :cdr => ->(list) {
        list.cdr
      },
      :cons => ->(car, cdr) {
        car.cons(cdr)
      },
      :null? => ->(value) {
        Boolean.new(value.null?)
      },
      :atom? => ->(value)  {
        Boolean.new(value.atom?)
      },
      :eq? => ->(value, other) {
        value.eq?(other)
      },
      :quote => ->(value) {
        value.quote
      }
    }



    def initialize(s_expressions)
      @s_expressions = s_expressions
    end

    def evaluate(environment={})
      s_expressions.first.evaluate(BUILT_IN_FUNCTIONS.merge(environment))
    end

    attr_reader :s_expressions
  end
end
