RSpec.describe SmartPensionTest::LogAnalyzer do

  it 'takes parsed log file as an initialize argument' do
    described_class.new([])
  end
end