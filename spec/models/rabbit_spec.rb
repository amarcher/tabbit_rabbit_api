require 'rails_helper'

RSpec.describe Rabbit, type: :model do

  let(:rabbit) { Rabbit.new }

  it 'should have methods #user, #items and #tabs' do
    [:user, :items, :tabs].each { |method| rabbit.should respond_to method }
  end
end
