# frozen_string_literal: true

require "sym_differ/invalid_variable_given_to_expression_parser_error"
require "sym_differ/unparseable_expression_text_error"
require "sym_differ/expression_text_language_compiler/empty_expression_text_error"
require "sym_differ/expression_text_language_compiler/unrecognized_token_error"
require "sym_differ/expression_text_language_compiler/invalid_syntax_error"

module SymDifferCli
  # Renders the given expression into a suitable Terminal view.
  class DerivativeExpressionExceptionViewRenderer
    def initialize(terminal_text_colorizer)
      @terminal_text_colorizer = terminal_text_colorizer
    end

    def render(exception)
      root_cause_exception = exception&.cause || exception

      render_if_invalid_variable_given_to_expression_parser_error(root_cause_exception) ||
        render_if_empty_expression_text_error(root_cause_exception) ||
        render_if_invalid_syntax_error(root_cause_exception) ||
        render_if_unrecognized_token_error(root_cause_exception)
    end

    private

    def render_if_invalid_variable_given_to_expression_parser_error(exception)
      return unless exception.is_a?(SymDiffer::InvalidVariableGivenToExpressionParserError)

      invalid_variable_name = @terminal_text_colorizer.make_red(exception.invalid_variable_name)
      "Invalid variable #{invalid_variable_name} provided for differentiation, must match [a-zA-Z]+"
    end

    def render_if_empty_expression_text_error(exception)
      return unless exception.is_a?(SymDiffer::ExpressionTextLanguageCompiler::EmptyExpressionTextError)

      "The provided expression was empty, must be non-empty."
    end

    def render_if_invalid_syntax_error(exception)
      return unless exception.is_a?(SymDiffer::ExpressionTextLanguageCompiler::InvalidSyntaxError)

      "The provided expression's syntax is invalid."
    end

    def render_if_unrecognized_token_error(exception)
      return unless exception.is_a?(SymDiffer::ExpressionTextLanguageCompiler::UnrecognizedTokenError)

      "The provided expression contains unrecognizable characters."
    end
  end
end
