# frozen_string_literal: true

require "spec_helper"
require "sym_differ_cli/derivative_expressions_controller"

RSpec.describe SymDifferCli::DerivativeExpressionsController do
  describe "#get_derivative_expression" do
    subject(:get_derivative_expression) do
      described_class.new.get_derivative_expression(parameter)
    end

    context "when the parameter is 1, x" do
      let(:parameter) { "1, x" }

      it { is_expected.to have_attributes(message: "0") }
    end

    context "when the parameter is 1, .." do
      let(:parameter) { "1, .." }

      it "returns the expected error message" do
        expect(get_derivative_expression).to have_attributes(
          message: "Invalid variable #{make_ansi_red('..')} provided for differentiation, must match [a-zA-Z]+"
        )
      end
    end

    context "when the parameter is , x" do
      let(:parameter) { ", x" }

      it "returns the expected error message" do
        expect(get_derivative_expression).to have_attributes(
          message: "The provided expression was empty, must be non-empty."
        )
      end
    end

    define_method(:make_ansi_red) do |text|
      "\e[38;2;225;0;5\m#{text}\e[0m"
    end
  end
end
