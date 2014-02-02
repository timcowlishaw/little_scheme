require 'polyglot'
require 'treetop'

require 'little_scheme/program'
require 'little_scheme/node_extensions'
require 'little_scheme/atom'
require 'little_scheme/cons'
require 'little_scheme/null'
require 'little_scheme/boolean'

Treetop.load(File.join(File.dirname(__FILE__), "grammar.treetop"))
module LittleScheme
  class Parser
    def initialize(parser=SchemeGrammarParser.new)
      @parser = parser
    end

    def parse(string)
      Program.new(@parser.parse(string).s_expressions)
    end

    private

    attr_reader :parser
  end
end
