require 'spec_helper'

describe TextProcessing do

  # describe '.line_break_remove' do
  #   context 'with a single line' do
  #     it 'return a text without line break' do
  #       text = '...обставин і подання позичкового гро-'
  #       text_without_breacks = '...обставин і подання позичкового гро'
  #       expect(TextProcessing.line_break_remove(text)).to eq text_without_breacks
  #     end

  #     it 'return text with hyphen and dash' do
  #       text = 'кінець-кінцем — лише ...), як це буває при ку-'
  #       text_without_breacks = 'кінець-кінцем — лише ...), як це буває при ку'
  #     end
  #   end

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
  # end

  # describe '.ends_with_hyphen?' do
  #   it 'return true if ends with hyphen' do
  #     text = 'багато. Але серед таких обставин і подання позичкового гро-'
  #     expect(TextProcessing.ends_with_hyphen?(text)).to be true
  #   end
  #   it 'return false if ends with hyphen' do
  #     text = 'і тому капіталу, призначеного для позик,'
  #     expect(TextProcessing.ends_with_hyphen?(text)).to be false
  #   end
  # end

  # describe '.remove_last_word' do
  #   it 'return string without last word' do
  #     text = 'багато. Але серед таких обставин і подання позичкового гро-'
  #     cuted_text = 'багато. Але серед таких обставин і подання позичкового'
  #     expect(TextProcessing.remove_last_word(text)).to eq cuted_text
  #   end
  # end


  # describe '.remove_last_word' do
  #   it 'return string without last word' do
  #     text = 'багато. Але серед таких обставин і подання позичкового гро-'
  #     cuted_text = 'Але серед таких обставин і подання позичкового гро-'
  #     expect(TextProcessing.remove_first_word(text)).to eq cuted_text
  #   end
  # end

  describe '.change_quotes' do
    it 'return text with «...» instead „...“' do
      text1 =  ' с., р. 40). „Навпаки,
        єдино правильний метод той, щоб на доходи кожного року покладати
        зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
        одно, чи витрачено дану суму, чи ні“ (Captain '
      text2 =  ' с., р. 40). «Навпаки,
        єдино правильний метод той, щоб на доходи кожного року покладати
        зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
        одно, чи витрачено дану суму, чи ні» (Captain '
      expect(TextProcessing.change_quotes(text1)).to eq text2
    end
  end

  describe '.remove_trailing_whitespace' do
    it 'remove space in an end of a line' do
       text1 =  'Навпаки,
єдино правильний метод той, щоб на доходи кожного року покладати 
зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
одно, чи витрачено дану суму, чи ні“ (Captain'
       text2 =  'Навпаки,
єдино правильний метод той, щоб на доходи кожного року покладати
зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
одно, чи витрачено дану суму, чи ні“ (Captain'
       expect(TextProcessing.remove_trailing_whitespace(text1)).to eq text2
    end
    it 'remove space in a begining of a line' do
       text1 =  'Навпаки,
 єдино правильний метод той, щоб на доходи кожного року покладати
зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
одно, чи витрачено дану суму, чи ні“ (Captain'
       text2 =  'Навпаки,
єдино правильний метод той, щоб на доходи кожного року покладати
зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
одно, чи витрачено дану суму, чи ні“ (Captain'
       expect(TextProcessing.remove_trailing_whitespace(text1)).to eq text2
    end
    it 'remove multiple spaces' do
       text1 =  'Навпаки,
єдино  правильний метод той, щоб на доходи кожного року покладати
зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
одно, чи витрачено дану суму, чи ні“ (Captain'
       text2 =  'Навпаки,
єдино правильний метод той, щоб на доходи кожного року покладати
зневартнення, неминуче зв’язане з тим, щоб заслужити ці доходи, все
одно, чи витрачено дану суму, чи ні“ (Captain'
       expect(TextProcessing.remove_trailing_whitespace(text1)).to eq text2
    end
  end

  describe '.lowercase_headings' do
    it 'replace all laters to lowercase except first' do 
      text1 = 'КРУГОБІГ ТОВАРОВОГО КАПІТАЛУ'
      text2 = 'Кругобіг товарового капіталу'
      expect(TextProcessing.lowercase_headings(text1)).to eq text2
    end
  end 

  describe '.uppercase_line?' do 
    context 'a line with all uppercase laters' do
        it 'return true' do
          line = 'КРУГОБІГ ТОВАРОВОГО КАПІТАЛУ'
          expect(TextProcessing.uppercase_line?(line)).to be true
        end
    end
    context 'a ordinary line' do
      it 'return false' do
        line = "циркуляції є Г — Т... Т'—Г' — Г — Т — Г. При"
        expect(TextProcessing.uppercase_line?(line)).to be false
      end
    end
  end

end
