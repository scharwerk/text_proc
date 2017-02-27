class TextProcessing

  def self.line_break_remove(text)
    text.gsub(/-$/, "")  
  end

  def self.ends_with_hyphen?(line)
    line.end_with?('-')
  end

# try to delete in couple with a line end symbol
end