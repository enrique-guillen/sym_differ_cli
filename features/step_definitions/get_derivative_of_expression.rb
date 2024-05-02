# frozen_string_literal: true

Before do
  @subcommands = []
  @expression = ""
  @payload = nil
end

After do
  @subcommands = []
  @expression = ""
  @payload = nil
end

When("the user passes in the subcommands: {}") do |space_separated_subcommands|
  @subcommands = space_separated_subcommands.split
end

When("the user passes in the expression: {}") do |expression|
  @expression = expression
end

When("the user runs sym_differ_cli") do
  @payload = execute_sym_differ_cli_command(@subcommands, [@expression])
end

Then("the returned message should be: {}") do |text|
  expect(@payload).to eq(text)
end

Then("the returned message should be:") do |docstring|
  expect(@payload).to eq(docstring.undump)
end
