# sym_differ_cli

A command line interface for the SymDiffer project.

## Example
As of this commit:

![Screenshot from 2024-06-11 08-00-35](https://github.com/enrique-guillen/sym_differ_cli/assets/31013835/a13aa0b7-954d-4124-a7d7-298924c62dc7)

## Purpose and current state
This repository only exists to showcase an alternative usage of the [sym_differ](https://github.com/enrique-guillen/sym_differ)
gem as opposed to the main Web interface, and for that purpose only one use case of the application (getting a
derivative expression) is supported.

## Development instructions & commands
- There is a .ruby-version file that indicates with which Ruby version this project was developed. You can use `rbenv`
  or another method to install this Ruby version.
- Run `bundle install` to install all dependencies.
- To run the automated acceptance criteria tests, run `bundle exec cucumber`.
- To run RSpec tests: `bundle exec rspec spec`. The `spec/` folder contains typical unit tests.
- `rubocop` and `reek` should be executed for static analysis.

## See also
- [sym_differ_rails](https://github.com/enrique-guillen/sym_differ_rails) &
  [sym_differ_vue](https://github.com/enrique-guillen/sym_differ_vue) for the Web implementation.
- [sym_differ](https://github.com/enrique-guillen/sym_differ) for the application code that carries out all the
  relevant mathematical operations.
