# frozen_string_literal: true

require "sym_differ/expression_text_language_compiler/invalid_variable_given_to_expression_parser_error"
require "sym_differ/expression_text_language_compiler/empty_expression_text_error"
require "sym_differ/expression_text_language_compiler/unrecognized_token_error"
require "sym_differ/expression_text_language_compiler/unrecognized_function_name_error"
require "sym_differ/expression_text_language_compiler/unrecognized_special_named_constant_error"
require "sym_differ/expression_text_language_compiler/invalid_token_terminated_expression_error"
require "sym_differ/expression_text_language_compiler/empty_tokens_list_error"
require "sym_differ/expression_text_language_compiler/imbalanced_expression_error"
require "sym_differ/expression_text_language_compiler/expected_token_type_not_found_error"

module SymDifferCli
  # Renders the given expression into a suitable Terminal view.
  class DerivativeExpressionExceptionViewRenderer
    def initialize(terminal_text_colorizer)
      @terminal_text_colorizer = terminal_text_colorizer
    end

    def render(exception)
      exception.accept(MessageVisitor.new(@terminal_text_colorizer))
    end

    # Implements the SymDifferErrorVisitor interface for mapping each error type to an error message.
    class MessageVisitor
      def initialize(terminal_text_colorizer)
        @terminal_text_colorizer = terminal_text_colorizer
      end

      def visit_invalid_variable_given_to_expression_parser_error(exception)
        invalid_variable_name = @terminal_text_colorizer.make_red(exception.invalid_variable_name)
        "Invalid variable #{invalid_variable_name} provided for differentiation, must match [a-zA-Z]+"
      end

      def visit_empty_expression_text_error(_exception)
        "The provided expression was empty, must be non-empty."
      end

      def visit_unrecognized_token_error(_exception)
        "The provided expression contains unrecognizable characters."
      end

      def visit_unrecognized_function_name_error(_exception)
        "Part of the expression was correct function-application syntax, but the function name is not recognized."
      end

      def visit_unrecognized_special_named_constant_error(_exception)
        "A part of the expression was correct special-named constant syntax, but the name was not recognized."
      end

      def visit_empty_tokens_list_error(_exception)
        "The provided expression was not tokenized into a non-empty list of tokens."
      end

      def visit_imbalanced_expression_error(_exception)
        "The provided expression does not have balanced parenthesis."
      end

      def visit_expected_token_type_not_found_error(_exception)
        "Syntax error; did not find the expected token type / grammatical unit."
      end

      def visit_invalid_token_terminated_expression_error(_exception)
        "Syntax error; did not find the expected token type / grammatical unit at the end of text."
      end
    end
  end
end
