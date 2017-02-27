require 'spec_helper'

describe TextProcessing do

  describe '.line_break_remove' do
    context 'with a single line' do
      it 'return a text without line break' do
        text = '...обставин і подання позичкового гро-'
        text_without_breacks = '...обставин і подання позичкового гро'
        expect(TextProcessing.line_break_remove(text)).to eq text_without_breacks
      end

      it 'return text with hyphen and dash' do
        text = 'кінець-кінцем — лише ...), як це буває при ку-'
        text_without_breacks = 'кінець-кінцем — лише ...), як це буває при ку'
      end
    end

    # context 'with a multiline text' do
    #   it 'concatenate word with line breack' do
    #     text =
    #       'капіталу ще немає мови) меншає, і тому капіталу, призначеного для позик,
    #          стає порівняно багато. Але серед таких обставин і подання позичкового гро-
    #          шового капіталу, як пізніше виявиться, позитивно зростає.'
    #       text_without_breacks =
    #       'капіталу ще немає мови) меншає, і тому капіталу, призначеного для позик,
    #          стає порівняно багато. Але серед таких обставин і подання позичкового грошового
    #          капіталу, як пізніше виявиться, позитивно зростає.'

    #       expect(TextProcessing.line_break_remove(text)).to eq text_without_breacks 
    #       end
    # end
  end

  describe '.ends_with_hyphen?' do
    it 'return true if ends with hyphen' do
      text = 'багато. Але серед таких обставин і подання позичкового гро-'
      expect(TextProcessing.ends_with_hyphen?(text)).to be true
    end
    it 'return false if ends with hyphen' do
      text = 'і тому капіталу, призначеного для позик,'
      expect(TextProcessing.ends_with_hyphen?(text)).to be false
    end
  end

end
