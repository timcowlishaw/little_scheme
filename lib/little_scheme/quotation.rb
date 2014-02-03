require 'little_scheme/s_expression'
module LittleScheme
  class Quotation < SExpression
    def initialize(structure)
      @structure = structure
    end

    def atom?
      false
    end

    def list?
      false
    end

    def null?
      structure.null?
    end

    def ==(other)
      other.is_a?(Quotation) && structure == other.structure
    end

    def hash
      structure.hash
    end

    def inspect(n=0)
      "<LittleScheme::Quotation \"#{structure.inspect}\">"
    end

    def evaluate(environment={})
      return structure
    end

    attr_reader :structure
  end
end
