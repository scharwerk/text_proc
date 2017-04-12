# This is a class for automatic text upgrade
class TextProcessing
  def initialize(text)
    @text = text
  end
  # it is not correct to pass a text every time
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

  def change_quotes
    @text.gsub(/[„“]/, '„' => '«', '“' => '»')
  end

  def remove_trailing_whitespace
    @text.gsub(/ $/, '').gsub(/^ /, '').squeeze(' ')
  end

  def capitalize_line(line)
    line.capitalize
    # good news it will work for ruby 2.4.0
    # case methods works only with English
    # case conversion is effective only in ASCII region.
  end

  def uppercase_line?(line)
    line.match?(/\p{Upper}/) && !line.match?(/[\p{Lower}—.\/\\]/)
  end
  
  def remove_line_breaks
    @text.gsub(/(-\n)(\S+)\s/) { "#{$2}\n"}
    # In plain English, we looking for a pattern (/(-\n)(\S+)\s/),
    # that represent, hyphen then end of a line, then any charcter except
    # whitespace, then whitespace and replace with second group of pattern
    # $2 means (\S+), then end of a line \n
  end


  # def capitalize_heading(text)
  #   text.each line do |line|
  #     if self.upercase_line?(line) line.capitalize : line
  #   end
  # end
  # try to delete in couple with a line end symbol
end
