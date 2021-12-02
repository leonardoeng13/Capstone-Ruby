require_relative 'spec_helper'

describe MusicAlbum do
  describe '#can_be_archived' do
    context 'when published over 10 years ago and on spotify' do
      item = MusicAlbum.new(true, Time.new(2000, 12, 2))
      it 'should return true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published over 10 years ago and not on spotify' do
      item = MusicAlbum.new(false, Time.new(2000, 12, 2))
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years ago and on spotify' do
      it 'should return false' do
        item = MusicAlbum.new(true, Time.now)
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years ago and not on spotify' do
      it 'should return false' do
        item = MusicAlbum.new(false, Time.now)
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end