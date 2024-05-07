Feature: sym_differ_cli get derivative of expression.
  Users can pass in an expression to derive. The input will be a string and a string will be outputted.

  Rule: When calling the command with the help options, the help for the subcommand is displayed.
    Scenario: The command is called with subcommand derive, options --help
      Given the user passes in the subcommands: derive
      And I pass in the options --help

      When the user runs sym_differ_cli

      Then the output should contain:
      """
      Usage: sym_differ_cli derive [options] [expression],[variable]
      Prints the derivative expression of the input expression with respect to
      the specified variable.

      Examples:

        sym_differ_cli derive x + x, x
        sym_differ_cli derive "sine(x), x"
        sym_differ_cli derive "cosine(x), x"
      """

  Rule: When calling the command with subcommand and an expression parameter.

    Scenario: The command is called with subcommand derive, parameter 1, x.
      Given the user passes in the subcommands: derive
      And the user passes in the expression: 1, x

      When the user runs sym_differ_cli

      Then the returned message should be: 0

    Scenario: The command is called with subcommand derive, parameter 1, ..
      Given the user passes in the subcommands: derive
      And the user passes in the expression: 1, ..

      When the user runs sym_differ_cli

      Then the returned message should be:
      """ruby
      "Invalid variable \e[38;2;225;0;5m..\e[0m provided for differentiation, must match [a-zA-Z]+"
      """

    Scenario: The command is called with subcommand derive, parameter , x.
      Given the user passes in the subcommands: derive
      And the user passes in the expression: , x

      When the user runs sym_differ_cli

      Then the returned message should be: The provided expression was empty, must be non-empty.

    Scenario: The command is called with subcommand derive, parameter ;[, x.
      Given the user passes in the subcommands: derive
      And the user passes in the expression: ;[, x

      When the user runs sym_differ_cli

      Then the returned message should be: The provided expression contains unrecognizable characters.
