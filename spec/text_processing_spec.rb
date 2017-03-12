require 'spec_helper'

describe TextProcessing do
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
    context 'with a only formula on line' do
      # line = 'Т— Г —Т' # /Р
    end
  end
end
