require 'rails_helper'

RSpec.describe TabController, type: :controller do
  let(:tab) { Tab.new() }

  describe 'GET #index' do
    before(:each) do
      expect(Tab).to receive(:all).and_return([tab])
    end

    it 'responds with a 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it 'sets local variables' do
      get :index
      expect(assigns(:tabs)).to eq([tab])
    end
  end
end