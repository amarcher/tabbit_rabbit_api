require 'rails_helper'

RSpec.describe TabController, type: :controller do
  let(:tab) { Tab.new }
  let(:user) { User.new }

  before :each do
    user.tabs << tab
    user.save!
    user.reload
  end

  after :each do
    user.destroy
  end

  describe 'GET #index' do
    context 'with valid user' do
      before :each do
        controller.instance_variable_set(:@user, user)
      end

      it 'responds with a 200' do
        get :index, xhr: true

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'returns the tabs as json' do
        get :index, xhr: true

        expect(response.body).to eq([tab].to_json)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid user' do
      before :each do
        controller.instance_variable_set(:@user, user)
      end

      it 'responds with a 200' do
        post :create, xhr: true

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'returns a new tabs with an id as json' do
        post :create, xhr: true
        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(json_response[:id]).to be > 0
      end
    end
  end

  describe 'POST #update' do
    let(:item) { Item.new({ price: 13, name: 'Pizza' }) }
    let(:cloned_tab) { JSON.parse(tab.to_json, symbolize_names: true) }
    let(:updated_tab) { cloned_tab }
    let(:params) do
      {
        id: tab.id,
        tab: updated_tab.to_json
      }
    end

    context 'with valid user' do
      before :each do
        controller.instance_variable_set(:@user, user)
      end

      context 'with new name' do
        let(:updated_tab) { cloned_tab.merge(name: 'My Tab') }

        it 'responds with a 200' do
          post :update, params

          expect(response).to be_success
          expect(response).to have_http_status(200)
        end

        it 'returns updated tab' do
          post :update, params
          json_response = JSON.parse(response.body, symbolize_names: true)

          expect(json_response[:id]).to eq tab.id
          expect(json_response[:name]).to eq 'My Tab'

          tab.reload
          expect(tab.name).to eq 'My Tab'
        end
      end

      context 'with new rabbits' do
        let(:updated_tab) { cloned_tab.merge(name: 'My Tab') }

        it 'responds with a 200' do
          post :update, params

          expect(response).to be_success
          expect(response).to have_http_status(200)
        end

        it 'returns updated tab' do
          post :update, params
          json_response = JSON.parse(response.body, symbolize_names: true)

          expect(json_response[:id]).to eq tab.id
          expect(json_response[:name]).to eq 'My Tab'

          tab.reload
          expect(tab.name).to eq 'My Tab'
        end
      end
    end
  end
end