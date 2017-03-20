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
      textProc = TextProcessing.new(text1)
      expect(textProc.change_quotes).to eq text2
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
      textProc = TextProcessing.new(text1)
      expect(textProc.remove_trailing_whitespace).to eq text2
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
      textProc = TextProcessing.new(text1)
      expect(textProc.remove_trailing_whitespace).to eq text2
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
      textProc = TextProcessing.new(text1)
      expect(textProc.remove_trailing_whitespace).to eq text2
    end
  end
  
  describe '.lowercase_headings' do
    it 'replace all laters to lowercase except first' do
      line1 = 'КРУГОБІГ ТОВАРОВОГО КАПІТАЛУ'
      line2 = 'Кругобіг товарового капіталу'
      textProc = TextProcessing.new(line1)
      expect(textProc.lowercase_headings(line1)).to eq line2
    end
  end

  describe '.uppercase_line?' do
    context 'a line with all uppercase laters' do
      it 'return true' do
        line = 'КРУГОБІГ ТОВАРОВОГО КАПІТАЛУ'
        textProc = TextProcessing.new(line)
        expect(textProc.uppercase_line?(line)).to be true
      end
    end
    context 'a ordinary line' do
      it 'return false' do
        line = "циркуляції є Г — Т... Т'—Г' — Г — Т — Г. При"
        textProc = TextProcessing.new(line)
        expect(textProc.uppercase_line?(line)).to be false
      end
    end
    context 'with a only formula on line' do
      it 'return false, the formula contains dashes' do
        line = 'Т— Г —Т' 
        textProc = TextProcessing.new(line)
        expect(textProc.uppercase_line?(line)).to be false
      end
      it 'return false, the formula contains dots' do
        line = "Т...Т'"
        textProc = TextProcessing.new(line)
        expect(textProc.uppercase_line?(line)).to be false
      end
      it 'return false, the formula contains slash' do
        line = '/Р'
        textProc = TextProcessing.new(line)
        expect(textProc.uppercase_line?(line)).to be false
      end
      it 'return false, the formula contains backslash' do
        line = '\Р'
        textProc = TextProcessing.new(line)
        expect(textProc.uppercase_line?(line)).to be false
      end

    end
  end

end
