# frozen_string_literal: true

require 'spec_helper'
require_relative '.././lib/validations/base_validator'
require_relative '.././lib/validator'

describe Validator do
  subject { described_class.new(log_path) }

  describe '#validate!' do
    let(:log_path) { 'log_path' }
    let(:validator_object) { instance_double(Validations::BaseValidator) }

    it 'calls each validator' do
      described_class::VALIDATORS.each do |validator|
        expect(validator).to receive(:new).with(log_path).and_return(validator_object)
        expect(validator_object).to receive(:validate!)
      end

      subject.validate!
    end
  end
end
