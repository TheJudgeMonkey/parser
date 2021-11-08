class FormatFileValidator
  def initialize(log_path)
    @log_path = log_path
  end

  ERROR_MESSAGE = "File format must be .log"

  def validate
    ERROR_MESSAGE unless log_path.to_s == '.log'
  end

  private

  attr_reader :log_path
end
