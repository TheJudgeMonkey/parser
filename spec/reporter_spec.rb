# frozen_string_literal: true

require 'spec_helper'
require_relative '.././lib/reporter'
require_relative '.././lib/counter'

describe Reporter do
  subject { described_class.new(views) }

  let(:views) do
    [
      ['/about', counter1],
      ['/index', counter2],
      ['/home', counter3]
    ]
  end
  let(:counter1) { instance_double(Counter, most_page_views: 12, unique_page_views: 3) }
  let(:counter2) { instance_double(Counter, most_page_views: 4, unique_page_views: 10) }
  let(:counter3) { instance_double(Counter, most_page_views: 6, unique_page_views: 8) }

  describe '#print_most_page_views' do
    let(:expected_result) do
      "* /about - 12 views\n* /index - 4 views\n* /home - 6 views\n"
    end

    it 'show most page views' do
      expect { subject.print_most_page_views }.to output(expected_result).to_stdout
    end
  end

  describe '#print_unique_page_views' do
    let(:expected_result) do
      "* /about - 3 views\n* /index - 10 views\n* /home - 8 views\n"
    end

    it 'show unique views' do
      expect { subject.print_unique_page_views }.to output(expected_result).to_stdout
    end
  end
end
