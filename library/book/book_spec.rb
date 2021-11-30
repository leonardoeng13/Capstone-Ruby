require_relative '../book'

describe Book do
  before :each do
    @book_album = [Book.new('Oracle for developers', 'Old', '2003-04-15'), Book.new('head first ruby a brain-friendly guide', 'New', '2021-11-30')]
  end

  it 'Can be archived?' do
    can_be_archived = @book_album[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end

  it 'Can be archived?' do
    can_be_archived = @book_album[1].send(:can_be_archived?)
    expect(can_be_archived).to be false
  end
end
