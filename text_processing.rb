# This is a class for automatic text upgrade
class TextProcessing
  def initialize(text)
    @text = text
  end

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


  def capitalize_heading(text)
    #ToDo somehow remuve new_text variable
    new_text = ""
    text.each_line do |line|
      self.uppercase_line?(line) ? new_text << line.capitalize : new_text << line
    end
    new_text
  end

  def add_empty_line
    @text.match?(/\S\z/) ? @text << "\n" : @text 
    #\z match end of a string
    #\S march any symbol except whitespace and Line seperator
  end
end
