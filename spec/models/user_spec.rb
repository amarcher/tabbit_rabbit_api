require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      name: 'Andrew',
      email: 'aarcher520@gmail.com',
      phone_number: '415-555-5555'
    )
  end
  let(:rabbit) do
    Rabbit.new(id: 123)
  end
  let(:auth_token) { "auniquetoken123" }

  it 'should have methods #tab and #rabbits' do
    [:tabs, :rabbits].each { |method| expect(user).to respond_to method }
  end

  it 'should have an auth_token method' do
    expect(user).to respond_to :auth_token
  end

  it 'should create a rabbit before_create, assign that rabbit to be its avatar & add it to its rabbits' do
    expect(Rabbit).to receive(:create).with(name: 'Andrew', email: 'aarcher520@gmail.com', phone_number: '415-555-5555')
                                      .and_return(rabbit)
    user.save!
    expect(user.avatar_rabbit_id).to eq 123
    expect(user.rabbits).to eq [rabbit]
    user.destroy
  end

  describe '#generate_authentication_token!' do
    it "generates a unique token" do
      expect(SecureRandom).to receive(:hex).and_return(auth_token)
      user.generate_authentication_token!
      expect(user.auth_token).to eq auth_token
    end

    it "generates another token when one already has been taken" do
      existing_user = User.new(
        name: 'Herald',
        email: 'herald@gmail.com',
        phone_number: '415-209-3333'
      )
      existing_user.save!
      user.generate_authentication_token!
      expect(user.auth_token).not_to eq existing_user.auth_token
      existing_user.destroy
    end
  end

  describe '#password' do
    it 'should unhash a password stored in the DB' do
      expect(user).to receive(:password_hash).and_return('hashed_password_from_db')
      expect(BCrypt::Password).to receive(:new).with('hashed_password_from_db').and_return('unhashed_password')
      expect(user.password).to eq 'unhashed_password'
    end

    it 'should return the unhashed password set with password=' do
      user.password = 'password'
      expect(user.password).to eq 'password'
    end
  end

  describe '#password=' do
    it 'should set a password as a hash' do
      expect(BCrypt::Password).to receive(:create).with('unhashed_password').and_return('hashed_password')
      user.password = 'unhashed_password'
      expect(user.instance_variable_get(:@password)).to eq 'hashed_password'
    end
  end
end
