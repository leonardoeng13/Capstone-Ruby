require_relative 'spec_helper'

describe Movie do
  describe '#can_be_archived' do
    context 'when published over 10 years ago or silent' do
      item = Movie.new(true, Time.new(2000, 12, 2))
      it 'should return true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published over 10 years ago and not silent' do
      item = Movie.new(false, Time.new(2000, 12, 2))
      it 'should return false' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published less than 10 years ago and silent' do
      it 'should return false' do
        item = Movie.new(true, Time.now)
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published less than 10 years ago and not silent' do
      it 'should return false' do
        item = MusicAlbum.new(false, Time.now)
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
