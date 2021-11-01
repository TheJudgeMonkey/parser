require_relative './spec_helper'
require_relative ".././lib/log_parser"

RSpec.describe LogParser do
  let(:log_path) { 'spec/webserver_test.log' }
  subject { described_class.new(log_path) }

  describe 'Parse all' do
    before { subject.parse }

    let(:expected_results) do
      {
        '/home'   => ['111.222.333.444'],
        '/index' => ['111.111.111.111', '111.222.333.444'],
        '/about'   => ['222.222.222.222', '222.222.222.222', '222.222.222.222'],
        '/about/2' => ['333.333.333.333']
      }
    end

    it "parses the data correctly" do
      expect(subject.logs).to eq(expected_results)
    end
  end
end
