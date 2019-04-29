RSpec.describe SmartPensionTest::LogAnalyzer do

  it 'takes parsed log file as an initialize argument' do
    described_class.new([])
  end

  describe '#most_page_views' do

    it 'is an collection' do
      log_analyzer = described_class.new([])
      expect(log_analyzer.most_page_views).to be_kind_of Enumerable
    end
  end

end