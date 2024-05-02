Feature: Get sym_differ_cli help
  Users should be able to retrieve some sort of basic text letting them know how to use the command.

  Rule: When passing the help option, the default help message is displayed.

    Scenario: The default help message is displayed.
      When I successfully run `ruby ./exe/sym_differ_cli`
      Then the output should contain:
      """
      Usage: sym_differ_cli [options] [--]
      Executes the specified mathematical operation against the provided input.

        --help, -[hH]    Prints a brief explanation on the usage of the sym_differ_cli
                         command.

      The command's homepage is located at HOME_PAGE. You can report issues there.
      """
