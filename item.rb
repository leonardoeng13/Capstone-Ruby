# rubocop:disable Metrics/ParameterLists
require 'time_diff'

# Create class ITEM
class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id

  def initialize(id, genre, author, source, label, publish_date)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    diff = Time.diff(Date.parse(@publish_date), Date.today)
    puts diff[:year] > 10
    diff[:year] > 10
  end

  private :can_be_archived?
end
# rubocop:enable Metrics/ParameterLists
