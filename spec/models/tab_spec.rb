require 'rails_helper'

RSpec.describe Tab, type: :model do

  let(:tab) { Tab.new }
  let(:dine_date) { Date.today }

  it 'should have methods #user, #items and #rabbits' do
    [:user, :items, :rabbits].each { |method| expect(tab).to respond_to method }
  end

  it 'before_create, it should assign dine_date to be today' do
    expect(Date).to receive(:today).and_return(dine_date)
    tab.save!
    expect(tab.dine_date).to eq(dine_date)
    tab.destroy
  end
end
