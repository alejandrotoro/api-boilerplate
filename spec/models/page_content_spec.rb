require 'rails_helper'

RSpec.describe PageContent, type: :model do
  subject { described_class.new }

  describe "Associations" do
    it { should belong_to(:page) }
  end
end
