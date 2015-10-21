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

  it 'should have methods #tab and #rabbits' do
    [:tabs, :rabbits].each { |method| user.should respond_to method }
  end

  it 'should create a rabbit before_create, assign that rabbit to be its avatar & add it to its rabbits' do
    expect(Rabbit).to receive(:create).with(name: 'Andrew', email: 'aarcher520@gmail.com', phone_number: '415-555-5555')
                                      .and_return(rabbit)
    user.save!
    user.avatar_rabbit_id.should == 123
    user.rabbits.should == [rabbit]
    user.destroy
  end

  describe '#password' do
    it 'should unhash a password stored in the DB' do
      expect(user).to receive(:password_hash).and_return('hashed_password_from_db')
      expect(BCrypt::Password).to receive(:new).with('hashed_password_from_db').and_return('unhashed_password')
      user.password.should == 'unhashed_password'
    end

    it 'should return the unhashed password set with password=' do
      user.password = 'password'
      user.password.should == 'password'
    end
  end

  describe '#password=' do
    it 'should set a password as a hash' do
      expect(BCrypt::Password).to receive(:create).with('unhashed_password').and_return('hashed_password')
      user.password = 'unhashed_password'
      user.instance_variable_get(:@password).should == 'hashed_password'
    end
  end
end
