require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.new }

  it 'should have methods #tab and #rabbits' do
    [:tab, :rabbits].each { |method| item.should respond_to method }
  end
end