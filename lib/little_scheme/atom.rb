require 'little_scheme/s_expression'
require 'little_scheme/boolean'
module LittleScheme
  class Atom < SExpression
    def initialize(identifier)
      @identifier = identifier
    end

    attr_reader :identifier

    def atom?
      true
    end

    def list?
      false
    end

    def eq?(other)
      if self == other
        Boolean.new(true)
      else
        Boolean.new(false)
      end
    end

    def ==(other)
      other.is_a?(Atom) && identifier == other.identifier
    end

    def hash
      identifier.hash
    end

    def inspect(n=0)
      "<LittleScheme::Atom \"#{identifier}\">"
    end

    def evaluate(environment={})
      environment[identifier]
    end

    def apply(environment, *arguments)
      evaluate(environment).call(*arguments)
    end
  end
end
