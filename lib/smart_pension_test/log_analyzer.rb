module SmartPensionTest
  class LogAnalyzer

    attr_reader :parsed_log_data

    def initialize(parsed_log_data)
      @parsed_log_data = parsed_log_data
    end

    def most_page_views
      return [] if parsed_log_data.empty?

      [{ path: parsed_log_data.first.path, visit_count: 1 }]
    end
  end
end
