class EmptyFileValidator
  def initialize(log_path)
    @log_path = log_path
  end

  ERROR_MESSAGE = "File can't be empty"

  def validate
    ERROR_MESSAGE if File.zero?(file_path)
  end

  private

  attr_reader :log_path
end
