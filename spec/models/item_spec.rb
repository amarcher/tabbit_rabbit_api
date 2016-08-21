require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.new }

  it 'should have methods #tab and #rabbits' do
    [:tab, :rabbits].each { |method| expect(item).to respond_to(method) }
  end
end