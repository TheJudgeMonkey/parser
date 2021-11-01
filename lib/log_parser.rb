class LogParser
  attr_accessor :log_path, :logs

  def initialize(log_path)
    @log_path = File.open(log_path)
    @logs = {}
  end

  def parse
    @log_path.each do |line|
      path, ip = line.split(" ")
      @logs[path] = [] unless @logs.key?(path)
      @logs[path] << ip
    end
  end

  def page_views
    @sorting = @logs.sort_by {|_, ip| -ip.length}.to_h
    @page_views = @sorting.each do |path, ip|
      puts "#{path} #{ip.size} views"
    end
  end

  def unique_page_views
    @unique_page_views = @logs.each do |path, ip|
      puts "#{path} #{ip.uniq.size} uniq views"
    end
  end
end
