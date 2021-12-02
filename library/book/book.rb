# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/ParameterLists
require './item'
# Create class Book
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :publish_date

  def initialize(id, genre, author, source, label, publisher, cover_state, publish_date)
    super(id, genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    "Publisher\'s name : \"#{@publisher}\" ~ Published on : #{@publish_date} ~ Cover state: #{@cover_state ? 'Good state' : 'Bad state'}"
  end

  def can_be_archived?
    true if super || @cover_state == 'bad'
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/ParameterLists
