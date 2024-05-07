Feature: Get sym_differ_cli help
  Users should be able to retrieve some sort of basic text letting them know how to use the command.

  Rule: When calling the command without options, the default help text displays.

    Scenario: The command is called without options.
      When I successfully run sym_differ_cli

      Then the output should contain:
      """
      Usage: sym_differ_cli [options] [subcommands] [values]
      Executes the specified mathematical operation against the provided input.

        --help, -[hH]    Prints a brief explanation on the usage of the sym_differ_cli
                         command.

      Example subcommands:

        derive           Prints the derivative expression of the input expression.

      The command's homepage is located at HOME_PAGE. You can report issues there.
      """

  Rule: When calling the command with the --help option, the default help text displays.

    Scenario: The command is called without options.
      When I successfully run sym_differ_cli
      And I pass in the options --help

      Then the output should contain:
      """
      Usage: sym_differ_cli [options] [subcommands] [values]
      Executes the specified mathematical operation against the provided input.

        --help, -[hH]    Prints a brief explanation on the usage of the sym_differ_cli
                         command.

      Example subcommands:

        derive           Prints the derivative expression of the input expression.

      The command's homepage is located at HOME_PAGE. You can report issues there.
      """
