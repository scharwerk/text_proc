# This is a class for automatic text upgrade
class TextProcessing
  # def self.line_break_remove(text)
  #   text.gsub(/-$/, "")
  # end

  # def self.ends_with_hyphen?(line)
  #   line.end_with?('-')
  # end

  # def self.remove_last_word(line)
  #   line[0...line.rindex(' ')]
  # end

  # def self.remove_first_word(line)
  #   line[1...(line.rindex(' ')+1)]
  # end

  def self.change_quotes(text)
    text.gsub(/[„“]/, '„' => '«', '“' => '»')
  end

  def self.remove_trailing_whitespace(text)
    text.gsub(/ $/, '').gsub(/^ /, '').squeeze(' ')
  end

  def self.lowercase_headings(text)
    text.capitalize
    # good news it will work for ruby 2.4.0
    # case methods works only with English
    # case conversion is effective only in ASCII region.
  end

  def self.uppercase_line?(line)
    line.match?(/\p{Upper}/) && !line.match?(/\p{Lower}/)
    # if we met any Lowercase char
  end
  # try to delete in couple with a line end symbol
end
