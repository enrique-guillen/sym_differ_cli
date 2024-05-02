# frozen_string_literal: true

module SymDifferCli
  # Converts text color utilizing ANSI escape codes.
  class AnsiTerminalTextColorizer
    def make_red(text)
      [SET_FOREGROUND_COLOR_ESCAPE_SEQUENCE,
       RED_FOREGROUND_COLOR_SCHEME,
       text,
       END_OF_PARAMETER_LIST_ESCAPE_SEQUENCE].join
    end

    SET_FOREGROUND_COLOR_ESCAPE_SEQUENCE = "\e[38;2;"
    RED_FOREGROUND_COLOR_SCHEME = "225;0;5\m"
    END_OF_PARAMETER_LIST_ESCAPE_SEQUENCE = "\e[0m"

    private_constant :SET_FOREGROUND_COLOR_ESCAPE_SEQUENCE,
                     :RED_FOREGROUND_COLOR_SCHEME,
                     :END_OF_PARAMETER_LIST_ESCAPE_SEQUENCE
  end
end
