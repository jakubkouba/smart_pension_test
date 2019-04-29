RSpec.describe SmartPensionTest::LogParser do
  let(:log_file) { File.expand_path('support/webserver.log') }

  it 'takes a log file as an initialize argument' do
    described_class.new(log_file)
  end

  describe '#data' do

    it 'is an array' do
      log_parser = described_class.new(log_file)
      expect(log_parser.data).to be_an Array
    end
  end
end