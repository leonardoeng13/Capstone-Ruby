require_relative 'spec_helper'

describe Game do
  describe '#can_be_archived' do
    context 'when published over 10 years ago and last played over 2 years' do
      item = Game.new(true, Time.new(2012, 12, 2), Time.new(2010, 12, 2))
      it 'should return true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published over 10 years ago and last played less than 2 years' do
      item = Game.new(true, Time.now, Time.new(2010, 12, 2))
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years ago and last played less than 2 years' do
      it 'should return false' do
        item = Game.new(true, Time.now, Time.now)
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years ago and last played over 2 years' do
      it 'should return false' do
        item = Game.new(true, Time.new(2012, 12, 2), Time.now)
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
