require 'little_scheme/s_expression'
module LittleScheme
  class Boolean < SExpression
    def initialize(value)
      @value = value
    end
  end
end
