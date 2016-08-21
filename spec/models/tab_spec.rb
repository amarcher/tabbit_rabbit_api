require 'rails_helper'

RSpec.describe Tab, type: :model do

  let(:tab) { Tab.new }
  let(:dine_date) { Date.today }

  it 'should have methods #user, #items and #rabbits' do
    [:user, :items, :rabbits].each { |method| tab.should respond_to method }
  end

  it 'before_create, it should assign dine_date to be today' do
    expect(Date).to receive(:today).and_return(dine_date)
    tab.save!
    tab.dine_date.should == dine_date
    tab.destroy
  end
end
