module LittleScheme
  class Program
    def initialize(s_expressions)
      @s_expressions = s_expressions
    end

    def evaluate(environment={})
      s_expressions.first.evaluate(environment)
    end

    attr_reader :s_expressions
  end
end
