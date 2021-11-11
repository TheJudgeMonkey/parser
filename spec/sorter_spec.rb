# frozen_string_literal: true

require 'spec_helper'
require_relative '.././lib/sorter'
require_relative '.././lib/counter'

describe Sorter do
  subject { described_class.new(logs) }

  let(:logs) do
    {
      '/about' => counter1,
      '/index' => counter2,
      '/home' => counter3
    }
  end
  let(:counter1) { instance_double(Counter, most_page_views: 12, unique_page_views: 3) }
  let(:counter2) { instance_double(Counter, most_page_views: 4, unique_page_views: 10) }
  let(:counter3) { instance_double(Counter, most_page_views: 6, unique_page_views: 8) }

  describe '#sort_most_page_views' do
    let(:expected_result) do
      [
        ['/about', counter1],
        ['/home', counter3],
        ['/index', counter2]
      ]
    end

    it 'show most page views' do
      expect(subject.sort_most_page_views).to eq expected_result
    end
  end
end
