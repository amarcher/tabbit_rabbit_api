require 'rails_helper'
require 'spec_helper'

class Authentication < ApplicationController
  include Authenticatable
end

describe Authenticatable, type: :helper do
  let(:user) do
    User.new(
      name: 'Andrew',
      email: 'aarcher520@gmail.com',
      phone_number: '415-555-5555',
      password: '12345678'
    )
  end

  let(:request) { ActionController::TestRequest.new }

  before :each do
    user.save!
  end

  after :each do
    user.destroy
  end

  let(:authentication) { Authentication.new }

  describe "#current_user" do
    context 'with a user' do
      before do
        authentication.instance_variable_set(:@user, user)
      end

      it 'returns the same user' do
        expect(authentication.current_user).to eq user
      end

      it 'does not find a different user' do
        expect(User).not_to receive(:find_by)
      end
    end

    context 'without a user' do
      context 'with a valid auth token' do
        before do
          request.headers["Authorization"] = user.auth_token
          expect(authentication).to receive(:request).and_return(request)
        end

        it 'returns that user' do
          expect(authentication.current_user).to eq user
        end
      end

      context 'with an invalid auth token' do
        before do
          request.headers["Authorization"] = 'invalid_token'
          expect(authentication).to receive(:request).and_return(request)
        end

        it 'returns nil' do
          expect(authentication.current_user).to be_nil
        end
      end
    end
  end
end