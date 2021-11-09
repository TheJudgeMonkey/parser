module Validations
  class BaseValidator
    def initialize(log_path)
      @log_path = log_path
    end

    def validate!
      raise NotImplementedError
    end

    private

    attr_reader :log_path
  end
end
