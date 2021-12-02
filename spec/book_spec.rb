require_relative 'spec_helper'

describe Book do
  describe '#can_be_archived' do
    context 'when published over 10 years' do
      item = Book.new('Oracle', 'good', Time.new(2003, 7, 30))
      it 'can be archived' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when cover state is bad' do
      it 'cannot be archived' do
        item = Book.new('Postgres', 'bad', Time.now)
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when cover state is good' do
      it 'cannot be archived' do
        item = Book.new('Oracle', 'good', Time.now)
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
