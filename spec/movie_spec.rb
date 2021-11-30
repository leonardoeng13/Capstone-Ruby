require_relative '../movie'

describe Movie do
  before(:each) do
    @movie = Movie.new(publish_date: '2020-10-10', silent: false, archived: false, name: 'Test')
  end

  it 'shows instance of Movie class' do
    expect(@movie).to be_instance_of Movie
  end

  it 'show inheritance from person class' do
    expect(@movie).to be_kind_of Item
  end

  it 'verifies archived return false' do
    expect(@movie.archived).to be false
  end

  it 'verifies silent return true' do
    expect(@movie.silent).to be false
  end
end
