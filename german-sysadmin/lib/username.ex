defmodule Username do

  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    # Please implement the sanitize/1 function

    sanitized_char = case head do
      head when head >= ?a and head <= ?z -> [head]
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> '_'
      _ -> ''
    end
    sanitized_char ++ sanitize(tail)
  end
end
