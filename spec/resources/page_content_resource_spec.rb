require 'rails_helper'

RSpec.describe PageContentResource, type: :resource do
  let(:page_content) { FactoryBot.create(:page_content) }
  subject { described_class.new(page_content, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :tag }
  it { is_expected.to have_attribute :content }
end