module LittleScheme
  class SExpression
    def s_expression?
      true
    end

    def s_expressions
      [self]
    end

    def cons(cdr)
      require 'little_scheme/cons' #lol circular dependencies
      raise "Can only cons onto a list" unless cdr.list?
      Cons.new(self, cdr)
    end

    def quote
      require 'little_scheme/quotation'
      Quotation.new(self)
    end
  end
end
