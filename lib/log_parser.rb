# frozen_string_literal: true

require_relative 'counter'
require_relative 'sorter'
require_relative 'reporter'
require_relative 'validator'
require_relative 'validations/validation_error'

class LogParser
  def initialize(log_path)
    @log_path = log_path
    @logs = {}
  end

  def parse
    validate!
    parse_log
    output
  rescue ValidationError => e
    warn e.message
  end

  private

  attr_reader :log_path, :logs

  def validate!
    Validator.new(log_path).validate!
  end

  def parse_log
    File.foreach(log_path) do |line|
      path, ip = line.split
      logs[path] = Counter.new if logs[path].nil?
      logs[path].add_ip(ip)
    end
  end

  def sorter
    @sorter ||= Sorter.new(logs)
  end

  def print_most_page_views
    sorted_views = sorter.sort_most_page_views
    Reporter.new(sorted_views).print_most_page_views
  end

  def print_unique_page_views
    sorted_views = sorter.sort_unique_page_views
    Reporter.new(sorted_views).print_unique_page_views
  end

  def output
    puts '=' * 30
    puts ' Most page views:'
    print_most_page_views
    puts '-' * 30
    puts ' Most unique page views:'
    print_unique_page_views
    puts '=' * 30
  end
end
