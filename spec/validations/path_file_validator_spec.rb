# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/validator'
require_relative '../../lib/validations/path_file_validator'

describe Validations::PathFileValidator do
  subject(:validator) { described_class.new(log_path) }

  describe '#validate!' do
    context 'when file is not exist' do
      let(:log_path) { nil }

      it 'raise error' do
        expect { validator.validate! }.to raise_error(ValidationError, "Path can't be empty")
      end
    end

    context 'when file is exist' do
      let(:log_path) { 'spec/fixtures/valid_webserver.log' }

      it 'raise nil' do
        expect { validator.validate! }.not_to raise_error
      end
    end
  end
end
