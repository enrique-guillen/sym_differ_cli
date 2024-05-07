# frozen_string_literal: true

require "spec_helper"
require "sym_differ_cli/help_controller"

RSpec.describe SymDifferCli::HelpController do
  describe "#display_help" do
    subject(:display_help) do
      described_class.new.display_help
    end

    it { is_expected.to have_attributes(message: <<~MESSAGE) }
      Usage: sym_differ_cli [options] [subcommands] [values]
      Executes the specified mathematical operation against the provided input.

        --help, -[hH]    Prints a brief explanation on the usage of the sym_differ_cli
                         command.

      Example subcommands:

        derive           Prints the derivative expression of the input expression.

      The command's homepage is located at HOME_PAGE. You can report issues there.
    MESSAGE
  end
end
