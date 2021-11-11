# frozen_string_literal: true

require_relative 'lib/log_parser'

LogParser.new(ARGV[0]).parse
