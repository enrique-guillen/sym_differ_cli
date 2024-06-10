# frozen_string_literal: true

require "spec_helper"
require "sym_differ_cli/derivative_expression_exception_view_renderer"

require "sym_differ/expression_text_language_compiler/invalid_variable_given_to_expression_parser_error"
require "sym_differ/expression_text_language_compiler/empty_expression_text_error"
require "sym_differ/expression_text_language_compiler/unrecognized_token_error"
require "sym_differ/expression_text_language_compiler/unrecognized_function_name_error"
require "sym_differ/expression_text_language_compiler/unrecognized_special_named_constant_error"
require "sym_differ/expression_text_language_compiler/invalid_token_terminated_expression_error"
require "sym_differ/expression_text_language_compiler/empty_tokens_list_error"
require "sym_differ/expression_text_language_compiler/imbalanced_expression_error"
require "sym_differ/expression_text_language_compiler/expected_token_type_not_found_error"

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

    context "when the exception is UnrecognizedTokenError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::UnrecognizedTokenError.new("") }

      it "returns the expected message" do
        expect(render).to eq("The provided expression contains unrecognizable characters.")
      end
    end

    context "when the exception is UnrecognizedFunctionNameError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::UnrecognizedFunctionNameError.new }

      it "returns the expected message" do
        expect(render).to eq(
          "Part of the expression was correct function-application syntax, but the function name is not recognized."
        )
      end
    end

    context "when the exception is UnrecognizedSpecialNamedConstantError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::UnrecognizedSpecialNamedConstantError.new }

      it "returns the expected message" do
        expect(render).to eq(
          "A part of the expression was correct special-named constant syntax, but the name was not recognized."
        )
      end
    end

    context "when the exception is EmptyTokensListError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::EmptyTokensListError.new }

      it "returns the expected message" do
        expect(render).to eq("The provided expression was not tokenized into a non-empty list of tokens.")
      end
    end

    context "when the exception is ImbalancedExpressionError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::ImbalancedExpressionError.new }

      it "returns the expected message" do
        expect(render).to eq("The provided expression does not have balanced parenthesis.")
      end
    end

    context "when the exception is ExpectedTokenTypeNotFoundError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::ExpectedTokenTypeNotFoundError.new }

      it "returns the expected message" do
        expect(render).to eq("Syntax error; did not find the expected token type / grammatical unit.")
      end
    end

    context "when the exception is InvalidTokenTerminatedExpressionError" do
      let(:exception) { SymDiffer::ExpressionTextLanguageCompiler::InvalidTokenTerminatedExpressionError.new }

      it "returns the expected message" do
        expect(render).to eq(
          "Syntax error; did not find the expected token type / grammatical unit at the end of text."
        )
      end
    end
  end
end
