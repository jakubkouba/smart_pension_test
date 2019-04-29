RSpec.describe SmartPensionTest::LogParser do
  let(:log_file) { File.expand_path('spec/support/webserver.log') }
  let(:log_parser) { described_class.new(log_file) }

  it 'takes a log file as an initialize argument' do
    described_class.new(log_file)
  end

  describe '#data' do

    it 'is an array' do
      expect(log_parser.data).to be_an Array
    end

    context 'when log file contains one log item' do
      let(:log_file) { File.expand_path('spec/support/file_with_one_log_item.log') }

      it 'has one item' do
        expect(log_parser.data.count).to eq 1
      end
    end
  end
end