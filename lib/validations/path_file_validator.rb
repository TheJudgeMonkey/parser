class PathFileValidator
  def initialize(log_path)
    @log_path = log_path
  end

  ERROR_MESSAGE = "Path can't be blank"

  def validate
    ERROR_MESSAGE if log_path.nil?
  end

  private

  attr_reader :log_path
end
