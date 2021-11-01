require_relative 'lib/log_parser.rb'

parser = LogParser.new(ARGV[0])
parser.parse

puts "=" * 32
puts "Most page views:"
parser.page_views

puts "=" * 32
puts "Unique page views:"
parser.unique_page_views
