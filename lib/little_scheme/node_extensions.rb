module Treetop
  module Runtime
    class SyntaxNode
      def s_expressions
        (elements || []).flat_map(&:s_expressions)
      end
    end
  end
end
