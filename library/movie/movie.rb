# rubocop:disable Metrics/ParameterLists
require './item'

# class Movie
class Movie < Item
  attr_accessor :silent

  def initialize(id, genre, author, source, label, silent, publish_date)
    super(id, genre, author, source, label, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'publish_date' => @publish_date,
      'silent' => @silent,
      'archived' => @archived
    }.to_json(*args)
  end
end
# rubocop:enable Metrics/ParameterLists
