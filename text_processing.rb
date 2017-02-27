class TextProcessing

  def self.line_break_remove(text)
    text.gsub(/-$/, "")  
  end
# try to delete in couple with a line end symbol
end