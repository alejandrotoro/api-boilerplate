require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:page) { create(:page) }
  let!(:pages) { create_list(:page, 2) }
  let(:valid_params) do
    {
      data: {
        type: 'pages',
        attributes: {
          'page-url': "http://www.lim.global/"
        }
      }
    }
  end
  let(:invalid_attributes) do
    FactoryBot.attributes_for(:page, page_url: nil)
  end


  describe "GET #show" do
    before do
      get :show, params: { :id => page.id }
    end

    it "returns http success" do
      expect(response).to be_successful
    end

    it "response with JSON body containing expected Page attributes" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["data"])
      expect(response).to match_json_schema("page")
    end
  end


  describe "GET #index" do
    before do
      get :index
    end

    it "returns http success" do
      expect(response).to be_successful
    end

    it "response with JSON body containing expected Page attributes" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["data"])
      expect(response).to match_json_schema("pages")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new page in the database" do
        post :create, params: valid_params
        expect(Page.count).to eq(2)
      end
    end

    context "with invalid attributes" do
      it "assigns the unsaved contact to @page" do
        post :create, params: { page: invalid_attributes }
        expect(assigns(:page)).to_not be_a_new(Page)
      end
    end
  end
end
