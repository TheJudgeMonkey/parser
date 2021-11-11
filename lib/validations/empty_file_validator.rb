# frozen_string_literal: true

require_relative 'base_validator'

module Validations
  class EmptyFileValidator < BaseValidator
    ERROR_MESSAGE = "File can't be empty"

    def validate!
      raise ValidationError, ERROR_MESSAGE if File.zero?(log_path)
    end
  end
end
