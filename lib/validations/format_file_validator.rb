require_relative 'base_validator'

module Validations
  class FormatFileValidator < BaseValidator
    ERROR_MESSAGE = "File format must be .log"

    def validate!
      raise ValidationError, ERROR_MESSAGE unless log_path.to_s == '.log'
    end
  end
end
