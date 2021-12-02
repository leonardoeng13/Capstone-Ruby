require_relative '../../module/item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_s
    "[Book] Publisher: \"#{@publisher}\", Cover State: #{@cover_state}, #{super}"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publisher' => @publisher,
                  'cover_state' => @cover_state
                }).to_json(*args)
  end

  def self.json_create(object)
    book = new(object['publisher'], object['cover_state'], Time.parse(object['publish_date']))
    book.id = object['id']
    book
  end
end
