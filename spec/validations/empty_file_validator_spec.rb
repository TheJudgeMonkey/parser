# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/validator'
require_relative '../../lib/validations/empty_file_validator'

describe Validations::EmptyFileValidator do
  subject(:validator) { described_class.new(log_path) }

  describe '#validate!' do
    context 'when file is empty' do
      let(:log_path) { 'spec/fixtures/empty_file.log' }

      it 'raise error' do
        expect { subject.validate! }.to raise_error(ValidationError, "File can't be empty")
      end
    end

    context 'when file is not empty' do
      let(:log_path) { 'spec/fixtures/valid_webserver.log' }

      it 'raise nil' do
        expect { subject.validate! }.not_to raise_error
      end
    end
  end
end
