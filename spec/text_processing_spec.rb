require 'spec_helper'

describe TextProcessing do
  describe '.line_break_remove' do
    it 'return text without line break' do
      text = '...обставин і подання позичкового гро-
              шового капіталу, як пізніше виявиться'
      text_without_breacks = '...обставин і подання позичкового гро
                              шового капіталу, як пізніше виявиться'
      expect(TextProcessing::line_break_remove(text)).to eq text 
    end  
  end
end