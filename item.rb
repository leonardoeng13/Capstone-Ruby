require 'time_diff'

# Create class ITEM
class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id

  def initialize(id, genre, author, source, label, publish_date)
    @id = Random.rand(1..10_000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    diff = Time.diff(Date.parse(@publish_date), Date.today)
    diff[:year] > 10
  end

  private :can_be_archived?
end
