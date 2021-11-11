# frozen_string_literal: true

require_relative 'validations/empty_file_validator'
require_relative 'validations/format_file_validator'
require_relative 'validations/path_file_validator'

class Validator
  VALIDATORS = [
    Validations::PathFileValidator,
    Validations::EmptyFileValidator,
    Validations::FormatFileValidator
  ].freeze

  def initialize(log_path)
    @log_path = log_path
  end

  def validate!
    VALIDATORS.each do |validator|
      validator.new(log_path).validate!
    end
  end

  private

  attr_reader :log_path
end
