# frozen_string_literal: true

class Sorter
  def initialize(logs)
    @logs = logs
  end

  def sort_most_page_views
    logs.sort_by { |_path, counter| -counter.most_page_views }
  end

  def sort_unique_page_views
    logs.sort_by { |_path, counter| -counter.unique_page_views }
  end

  private

  attr_reader :logs
end
