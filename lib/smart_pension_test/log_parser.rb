module SmartPensionTest
  class LogParser

    attr_reader :file

    def initialize(file)
      @file = file
    end

    def data
      File.readlines(file, chomp: true)
    end
  end
end
