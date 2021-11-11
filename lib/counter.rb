# frozen_string_literal: true

require 'set'

class Counter
  attr_reader :most_page_views

  def initialize
    @unique_ips = Set.new
    @most_page_views = 0
  end

  def add_ip(ip)
    @most_page_views += 1
    unique_ips.add(ip)
  end

  def unique_page_views
    unique_ips.count
  end

  private

  attr_reader :unique_ips
end
