require 'rails_helper'

RSpec.describe Page, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    expect(FactoryBot.create(:page)).to be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:page_url) }
  end

  describe "Associations" do
    it { should have_many(:page_contents) }
  end

  describe "Model Methods" do
    before do
      @page = FactoryBot.create(:page)
    end
    it "validates if the page is accessible" do
      expect(@page.is_accessible?).to be_truthy
    end
  end
end
