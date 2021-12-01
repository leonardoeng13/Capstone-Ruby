require_relative '../library/movie/movie'

describe 'Test1 for movies' do
  it 'verifies silent return false' do
    my_movie = Movie.new(false, '2021-12-01', 'Hancok')
    result = my_movie.silent
    expect(result).to be false
  end
end

describe 'Test2 for movies' do
  it 'verifies silent return false' do
    my_movie = Movie.new(false, '2021-12-01', 'Hancok')
    expect(my_movie).to be_instance_of Movie
  end
end

describe 'Test2 for movies' do
  it 'verifies silent return false' do
    my_movie = Movie.new(false, '2021-12-01', 'Hancok')
    expect(my_movie).to be_kind_of Item
  end
end
