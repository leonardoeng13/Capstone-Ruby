require_relative '../library/movie/movie'

describe 'Test1 for movies' do
  it 'verifies silent return false' do
    myMovie = Movie.new(false, '2021-12-01', 'Hancok')
    result = myMovie.silent
    expect(result).to be false
  end
end

describe 'Test2 for movies' do
  it 'verifies silent return false' do
    myMovie = Movie.new(false, '2021-12-01', 'Hancok')
    expect(myMovie).to be_instance_of Movie
  end
end

describe 'Test2 for movies' do
  it 'verifies silent return false' do
    myMovie = Movie.new(false, '2021-12-01', 'Hancok')
    expect(myMovie).to be_kind_of Item
  end
end
