require_relative '../../module/item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, *args)
    super(*args)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end

  def to_s
    "[Movie] Silent: #{@silent}, #{super}"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'silent' => @silent
                }).to_json(*args)
  end

  def self.json_create(object)
    movie = new(object['silent'], Time.parse(object['publish_date']))
    movie.id = object['id']
    movie
  end
end
