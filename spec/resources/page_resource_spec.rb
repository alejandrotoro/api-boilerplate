require 'rails_helper'

RSpec.describe PageResource, type: :resource do
  let(:page) { FactoryBot.create(:page) }
  subject { described_class.new(page, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :page_url }
  it { is_expected.to have_attribute :page_contents }
end