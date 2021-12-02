require_relative 'spec_helper'

describe Item do
  before :each do
    @item = Item.new(Time.now)
  end

  describe '#move_to_archive' do
    context 'when published less than 10 years' do
      it 'cannot be archived' do
        @item.move_to_archive
        expect(@item.archived).to be_falsey
      end
    end

    context 'when published over 10 years' do
      item = Item.new(Time.new(1995, 1, 1))
      item.move_to_archive

      it 'can be archived' do
        expect(item.archived).to be_truthy
      end
    end
  end

  describe '#add_genre' do
    it 'should add a genre' do
      @item.add_genre Genre.new('Oracle')
      expect(@item.genre).to be_an_instance_of Genre
    end
  end

  describe '#add_author' do
    it 'should add an author' do
      @item.add_author Author.new('Leo', 'Andrade')
      expect(@item.author).to be_an_instance_of Author
    end
  end

  describe '#add_source' do
    it 'should add a source' do
      @item.add_source Source.new('Oracle')
      expect(@item.source).to be_an_instance_of Source
    end
  end

  describe '#add_label' do
    it 'should add a label' do
      @item.add_label Label.new('Oracle', 'Blue')
      expect(@item.label).to be_an_instance_of Label
    end
  end
end
