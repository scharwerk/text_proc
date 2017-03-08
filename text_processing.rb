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
    
  end
# try to delete in couple with a line end symbol
end