# frozen_string_literal: true

require "spec_helper"
require "sym_differ_cli/ansi_terminal_text_colorizer"

RSpec.describe SymDifferCli::AnsiTerminalTextColorizer do
  describe "#make_red" do
    subject(:make_red) do
      described_class.new.make_red("_become_red_")
    end

    it { is_expected.to eq("\e[38;2;225;0;5m_become_red_\e[0m") }
  end
end
