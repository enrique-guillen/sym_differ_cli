# frozen_string_literal: true

require "spec_helper"
require "sym_differ_cli/derivative_expression_exception_view_renderer"

require "sym_differ/expression_text_language_compiler/invalid_variable_given_to_expression_parser_error"
require "sym_differ/expression_text_language_compiler/empty_expression_text_error"
require "sym_differ/expression_text_language_compiler/unrecognized_token_error"
require "sym_differ/expression_text_language_compiler/invalid_syntax_error"

RSpec.describe SymDifferCli::DerivativeExpressionExceptionViewRenderer do
  describe "#render" do
    subject(:render) { described_class.new(terminal_text_colorizer).render(exception) }

    let(:terminal_text_colorizer) { double(:terminal_text_colorizer) }

    context "when the exception is InvalidVariableGivenToExpressionParserError" do
      before do
        allow(terminal_text_colorizer).to receive(:make_red) { |text| "(red #{text})" }
      end

      let(:exception) do
        SymDiffer::ExpressionTextLanguageCompiler::InvalidVariableGivenToExpressionParserError.new("|.")
      end

      it "returns the expected message" do
        expect(render).to eq(
          "Invalid variable (red |.) provided for differentiation, must match [a-zA-Z]+"
        )
      end
    end

    context "when the exception is EmptyExpressionTextError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::EmptyExpressionTextError.new }

      it "returns the expected message" do
        expect(render).to eq("The provided expression was empty, must be non-empty.")
      end
    end

    context "when the exception is InvalidSyntaxError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::InvalidSyntaxError.new("") }

      it "returns the expected message" do
        expect(render).to eq("The provided expression's syntax is invalid.")
      end
    end

    context "when the exception is UnrecognizedToken" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::UnrecognizedTokenError.new("") }

      it "returns the expected message" do
        expect(render).to eq("The provided expression contains unrecognizable characters.")
      end
    end
  end
end
