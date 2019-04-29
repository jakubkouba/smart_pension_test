RSpec.describe SmartPensionTest::LogAnalyzer do

  it 'takes parsed log file as an initialize argument' do
    described_class.new([])
  end

  describe '#most_page_views' do

    it 'is an collection' do
      log_analyzer = described_class.new([])
      expect(log_analyzer.most_page_views).to be_kind_of Enumerable
    end

    context 'log contains one item' do

      it 'contains one item with path a and visit count 1' do
        parsed_log_item = [double('LogItem', path: 'a', ip_address: 1)]
        log_analyzer = described_class.new(parsed_log_item)
        expect(log_analyzer.most_page_views).to match([path: 'a', visit_count: 1])
      end
    end
  end

end
