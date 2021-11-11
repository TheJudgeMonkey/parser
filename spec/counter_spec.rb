# frozen_string_literal: true

require 'spec_helper'
require_relative '.././lib/counter'

describe Counter do
  subject { described_class.new }

  let(:ips) do
    [
      '222.222.222.222',
      '333.333.333.333',
      '222.222.222.222'
    ]
  end

  before do
    ips.each do |ip|
      subject.add_ip(ip)
    end
  end

  describe '#add_ip' do
    it 'counts ips' do
      expect(subject.most_page_views).to eq 3
      expect(subject.unique_page_views).to eq 2
    end
  end

  describe '#unique_page_views' do
    it 'returns unique views' do
      expect(subject.unique_page_views).to eq 2
    end
  end
end
