require 'ostruct'

module SmartPensionTest
  class LogParser

    attr_reader :file

    def initialize(file)
      @file = file
    end

    def data
      File.readlines(file, chomp: true).map do |log_item|
        path, ip_address = log_item.split(' ')
        OpenStruct.new(path: path, ip_address: ip_address)
      end
    end
  end
end
