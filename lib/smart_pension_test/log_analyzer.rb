module SmartPensionTest
  class LogAnalyzer

    attr_reader :parsed_log_data

    def initialize(parsed_log_data)
      @parsed_log_data = parsed_log_data
    end

    def most_page_views
      return [] if parsed_log_data.empty?

      parsed_log_data.each_with_object([]) do |log_item, list|
        list << { path: log_item.path, visit_count: 1 }
      end
    end
  end
end
