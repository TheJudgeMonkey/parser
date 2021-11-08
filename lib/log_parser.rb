require_relative 'counter'
require_relative 'sorter'
require_relative 'reporter'
# require_relative 'validator'

class LogParser
  def initialize(log_path)
    @log_path = File.open(log_path, 'r')
    @logs = {}
  end

  def parse
    log_parser
    output
  end

  private

  attr_reader :log_path, :logs

  def log_parser
    log_path.each do |line|
      path, ip = line.split
      logs[path] = Counter.new if logs[path].nil?
      logs[path].add_ip(ip)
    end
  end

  def print_most_page_views
    sorted_views = Sorter.new(logs).sort_most_page_views
    Reporter.new(sorted_views).print_most_page_views
  end

  def print_unique_page_views
    sorted_views = Sorter.new(logs).sort_unique_page_views
    Reporter.new(sorted_views).print_unique_page_views
  end

  def output
    puts '=' * 30
    puts " Most page views:"
    print_most_page_views
    puts '-' * 30
    puts " Most unique page views:"
    print_unique_page_views
    puts '=' * 30
  end
end
