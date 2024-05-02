# frozen_string_literal: true

require "open3"

module SymDifferCli
  # Allows converting an Expression into an inline textual representation of the expression, and from a free form
  # expression text into an Expression.
  module ShellCommandSupport
    def execute_sym_differ_cli_command(subcommands = [], parameters = [])
      execute_command_in_repository("sym_differ_cli", subcommands, parameters)
    end

    private

    def execute_command_in_repository(command_name, subcommands, parameters)
      repository_location_of_command = repository_location_of_command(command_name)
      working_directory_of_command = working_directory_of_command(repository_location_of_command)
      execute_shell_command(working_directory_of_command, subcommands, parameters)
    end

    def working_directory_of_command(command_path)
      "#{Dir.pwd}/#{command_path}"
    end

    def repository_location_of_command(command_name)
      "exe/#{command_name}"
    end

    def execute_shell_command(command_name_or_path, subcommands, parameters)
      Open3.popen3(command_name_or_path, *subcommands, *parameters) { |_, std_out, _, _| std_out.read.chomp }
    end
  end
end

World(SymDifferCli::ShellCommandSupport)
