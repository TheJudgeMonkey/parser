require_relative 'base_validator'

module Validations
  class PathFileValidator < BaseValidator
    ERROR_MESSAGE = "Path can't be blank"

    def validate!
      raise ValidationError, ERROR_MESSAGE if log_path.nil?
    end
  end
end
