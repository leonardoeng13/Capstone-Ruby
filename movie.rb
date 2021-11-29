require './item'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date:, silent:, archived: false, name: 'unknown')
    super(publish_date: publish_date, archived: archived, name: name)
    @silent = silent
  end

  def can_be_archived?
    super() || @silent
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

  private :can_be_archived?
end
