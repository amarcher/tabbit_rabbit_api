require 'rails_helper'

RSpec.describe TabController, type: :controller do
  let(:tab) { Tab.new }
  let(:user) { User.new }

  before :each do
    user.tabs << tab
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'responds with a 200' do
      xhr :get, :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'returns the tabs as json' do
      xhr :get, :index
      expect(response.body).to eq([tab].to_json)
    end
  end
end