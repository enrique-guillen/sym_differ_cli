# frozen_string_literal: true

module SymDifferCli
  # Displays help related to the SymDifferCli utility.
  class HelpController
    # Defines the high-level response of this use case.
    Response = Struct.new(:message)

    def display_help
      Response.new(render_view)
    end

    private

    def render_view
      <<~MESSAGE
        Usage: sym_differ_cli [options] [--]
        Executes the specified mathematical operation against the provided input.

          --help, -[hH]    Prints a brief explanation on the usage of the sym_differ_cli
                           command.

        The command's homepage is located at HOME_PAGE. You can report issues there.
      MESSAGE
    end
  end
end
