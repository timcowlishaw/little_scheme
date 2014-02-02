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
        Cons.new(self, cdr)
      end
  end
end
