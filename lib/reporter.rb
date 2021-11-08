class Reporter
  def initialize(views)
    @views = views
  end

  def print_most_page_views
    views.each do |path, ip_count| 
      puts "* #{path} - #{ip_count.most_page_views} views"
    end
  end

  def print_unique_page_views
    views.each do |path, ip_count| 
      puts "* #{path} - #{ip_count.unique_page_views} views" 
    end
  end

  private

  attr_reader :views
end
