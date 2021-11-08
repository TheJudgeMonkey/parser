class Sorter
  def initialize(logs)
    @logs = logs
  end

  def sort_most_page_views
    logs.sort_by { |_path, ip| ip.most_page_views }.reverse
  end

  def sort_unique_page_views
    logs.sort_by { |_path, ip| ip.unique_page_views }.reverse
  end

  private

  attr_reader :logs
end