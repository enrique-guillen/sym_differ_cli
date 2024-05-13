# frozen_string_literal: true

require "sym_differ/get_derivative_of_expression_interactor"
require "sym_differ/error"

require "sym_differ_cli/derivative_expression_exception_view_renderer"
require "sym_differ_cli/ansi_terminal_text_colorizer"

module SymDifferCli
  # Computes derivative expressions from the provided expressions.
  class DerivativeExpressionsController
    # Defines the high-level response of this use case.
    Response = Struct.new(:message)

    def get_derivative_expression(parameter)
      input = parameter.split(",", 2).map(&:strip)
      expression = input[0].to_s
      variable = input[1].to_s

      derivative_expression = calculate_derivative(expression, variable)

      render_view(derivative_expression)
    rescue SymDiffer::Error => e
      render_error_view(e)
    end

    def display_help
      render_view(help_message)
    end

    private

    def calculate_derivative(expression, variable)
      SymDiffer::GetDerivativeOfExpressionInteractor
        .new
        .calculate_derivative(expression, variable)
        .derivative_expression
    end

    def render_view(expression)
      Response.new(expression)
    end

    def render_error_view(exception)
      message = derivative_expression_exception_view_renderer.render(exception)
      Response.new(message)
    end

    def derivative_expression_exception_view_renderer
      DerivativeExpressionExceptionViewRenderer.new(ansi_terminal_text_colorizer)
    end

    def ansi_terminal_text_colorizer
      AnsiTerminalTextColorizer.new
    end

    def help_message
      <<~MESSAGE
        Usage: sym_differ_cli derive [options] [expression],[variable]
        Prints the derivative expression of the input expression with respect to
        the specified variable.

        Examples:

          sym_differ_cli derive x + x, x
          sym_differ_cli derive "sine(x), x"
          sym_differ_cli derive "cosine(x), x"
      MESSAGE
    end
  end
end
