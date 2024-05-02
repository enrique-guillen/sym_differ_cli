# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "sym_differ_cli"
  spec.summary = "CLI for sym_differ"
  spec.version = "1.0.0"
  spec.authors = ["The SymDiffer CLI contributors."]

  spec.files = ["lib/sym_differ_cli.rb"]
  spec.bindir = "exe"
  spec.required_ruby_version = "~> 3.3.0"

  spec.metadata = { "rubygems_mfa_required" => "true" }
  spec.licenses = ["MIT"]
end
