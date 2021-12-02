require_relative 'spec_helper'

describe Source do
  before :each do
    @source = Source.new 'microvermusic'
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new Time.now
      @source.add_item item
      expect(@source.items).to include(item)
    end
  end
end
