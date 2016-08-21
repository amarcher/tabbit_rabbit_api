require 'rails_helper'

RSpec.describe TabController, type: :controller do
  let(:tab) { Tab.new() }

  describe 'GET #index' do
    before(:each) do
      expect(Tab).to receive(:all).and_return([tab])
    end

    it 'responds with a 200' do
      xhr :get, :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the tabs as json" do
      xhr get :index
      expect(response).to eq([tab].to_json)
    end
  end
end