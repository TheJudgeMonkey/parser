# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/validator'
require_relative '../../lib/validations/base_validator'

describe Validations::BaseValidator do
  subject(:validator) { described_class.new(log_path) }

  let(:log_path) { 'log_path' }

  describe '#validate!' do
    it 'raises NotImplementedError' do
      expect { validator.validate! }.to raise_error(NotImplementedError)
    end
  end
end
