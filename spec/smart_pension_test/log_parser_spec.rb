RSpec.describe SmartPensionTest::LogParser do

  it 'takes a log file as an initialize argument' do
    log_file = File.expand_path('support/webserver.log')
    described_class.new(log_file)
  end
end