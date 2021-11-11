# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/validator'
require_relative '../../lib/validations/format_file_validator'

describe Validations::FormatFileValidator do
  subject(:validator) { described_class.new(log_path) }

  describe '#validate!' do
    context 'when format of file is incorrect' do
      let(:log_path) { 'spec/validations/format_file_validator_spec.rb' }

      it 'raise error' do
        expect { subject.validate! }.to raise_error(ValidationError, 'File format must be .log')
      end
    end

    context 'when format of file is correct' do
      let(:log_path) { 'spec/fixtures/valid_webserver.log' }

      it 'raise nil' do
        expect { subject.validate! }.not_to raise_error
      end
    end
  end
end
