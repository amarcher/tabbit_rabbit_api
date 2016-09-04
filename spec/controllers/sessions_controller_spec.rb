require 'rails_helper'
require 'json'

RSpec.describe SessionsController, type: :controller do
  let(:user) do
    User.new(
      name: 'Andrew',
      email: 'aarcher520@gmail.com',
      phone_number: '415-555-5555',
      password: '12345678'
    )
  end

  before :each do
    user.save!
  end

  after :each do
    user.destroy
  end

  describe "POST #create" do
    context "with correct credentials" do
      let(:credentials) { { email: user.email, password: '12345678' } }

      it "returns the user record corresponding to the given credentials" do
        xhr :post, :create, { session: credentials }
        user.reload
        expect(JSON.parse(response.body, symbolize_names: true)[:auth_token]).to eq user.auth_token
      end

      it 'responds with success' do
        xhr :post, :create, { session: credentials }
        expect(response.status).to eq 200
      end
    end

    context "when the credentials are incorrect" do
      let(:credentials) { { email: user.email, password: 'invalidpassword' } }

      it "returns a json with an error" do
        xhr :post, :create, { session: credentials }
        expect(JSON.parse(response.body, symbolize_names: true)[:errors]).to eq "Invalid email or password"
      end

      it 'responds with failure' do
        xhr :post, :create, { session: credentials }
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it 'should respond with 204' do
      delete :destroy, id: user.auth_token
      expect(response.status).to eq 204
    end
  end
end
