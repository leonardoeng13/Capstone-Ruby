require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('Leo', 'Andrade')
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new Time.now
      @author.add_item item
      expect(@author.items).to include(item)
    end
  end
end
