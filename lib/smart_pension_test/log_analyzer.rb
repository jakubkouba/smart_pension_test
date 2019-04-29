require 'set'
require 'byebug'

module SmartPensionTest
  class LogAnalyzer

    attr_reader :parsed_log_data

    def initialize(parsed_log_data)
      @parsed_log_data = parsed_log_data
    end

    def most_page_views
      return [] if parsed_log_data.empty?

      list = parsed_log_data.each_with_object([]) do |log_item, list|
        path_in_list = list.detect { |item| item[:path] == log_item.path }

        if path_in_list
          list[list.index(path_in_list)][:visit_count] += 1
        else
          list << { path: log_item.path, visit_count: 1 }
        end
      end

      list.sort_by { |item| item[:visit_count] }.reverse
    end

    def most_unique_page_views
      return [] if parsed_log_data.empty?

      ips_by_path = parsed_log_data.each_with_object({}) do |log_item, paths_with_ips|
        paths_with_ips[log_item.path] ||= Set.new([log_item.ip_address])
        paths_with_ips[log_item.path].add(log_item.ip_address) if paths_with_ips[log_item.path]
      end

      path_with_unique_visits = ips_by_path.map do |path, ips|
        { path: path, visit_count: ips.count }
      end

      path_with_unique_visits.sort_by { |item| item[:visit_count] }.reverse
    end
  end
end
