# frozen_string_literal: true

Before do
  @options = []
  @payload = nil
end

After do
  @options = nil
end

When("I pass in the options {}") do |space_separated_options|
  @options = space_separated_options.split
end

When("I successfully run sym_differ_cli") do
  @payload = execute_sym_differ_cli_command(@options)
end

Then("the output should contain:") do |docstring|
  expect(@payload).to eq(docstring)
end
