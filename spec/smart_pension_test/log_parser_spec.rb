RSpec.describe SmartPensionTest::LogParser do
  let(:log_file) { File.expand_path('spec/support/webserver.log') }
  let(:log_parser) { described_class.new(log_file) }

  it 'takes a log file as an initialize argument' do
    described_class.new(log_file)
  end

  describe '#data' do
    subject(:data) { log_parser.data }

    it 'is an array' do
      expect(data).to be_an Array
    end

    it 'is an array of log items objects' do
      log_item = data.first
      expect(log_item).to respond_to :path
      expect(log_item).to respond_to :ip_address
    end

    context 'when log file contains one log item' do
      let(:log_file) { File.expand_path('spec/support/file_with_one_log_item.log') }

      it 'has one item' do
        expect(data.count).to eq 1
      end
    end
  end
end