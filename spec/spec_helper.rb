# frozen_string_literal: true

require "simplecov"
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  (config.default_formatter = "doc") if config.files_to_run.one?

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random

  Kernel.srand config.seed

  RSpec::Matchers.alias_matcher :same_expression_as, :be_same_as
end
