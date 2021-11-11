# frozen_string_literal: true

require 'spec_helper'
require_relative '.././lib/log_parser'
require_relative '.././lib/validations/validation_error'
require_relative '.././lib/validations/format_file_validator'

describe LogParser do
  subject { described_class.new(log_path) }

  let(:log_path) { 'spec/fixtures/valid_webserver.log' }

  describe '#parse' do
    context 'when there were no errors'
    let(:expected_result) do
      <<~HEREDOC
        ==============================
         Most page views:
        * /about - 3 views
        * /index - 2 views
        * /home - 1 views
        * /about/2 - 1 views
        ------------------------------
         Most unique page views:
        * /index - 2 views
        * /home - 1 views
        * /about - 1 views
        * /about/2 - 1 views
        ==============================
      HEREDOC
    end

    it 'show the data correctly' do
      expect { subject.parse }.to output(expected_result).to_stdout
    end

    context 'when path is empty' do
      let(:log_path) { nil }

      it 'show error message' do
        expect { subject.parse }.to output("Path can't be empty\n").to_stderr
      end
    end

    context 'when file is empty' do
      let(:log_path) { 'spec/fixtures/empty_file.log' }

      it 'show error message' do
        expect { subject.parse }.to output("File can't be empty\n").to_stderr
      end
    end

    context 'when file is not a .log' do
      let(:log_path) { 'spec/fixtures/invalid_format.js' }

      it 'show error message' do
        expect { subject.parse }.to output("File format must be .log\n").to_stderr
      end
    end
  end
end
