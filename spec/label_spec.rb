require_relative 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('oracle', 'blue')
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new Time.now
      @label.add_item item
      expect(@label.items).to include(item)
    end
  end
end
