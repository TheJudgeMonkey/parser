# frozen_string_literal: true

require_relative 'base_validator'

module Validations
  class FormatFileValidator < BaseValidator
    ERROR_MESSAGE = 'File format must be .log'

    def validate!
      raise ValidationError, ERROR_MESSAGE if File.extname(log_path) != '.log'
    end
  end
end
