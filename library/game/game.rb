# rubocop:disable Layout/LineLength
require_relative '../../item'

# Create class Game
class Game < Item
  attr_accessor :last_played_at, :multiplayer
  attr_reader :publish_date

  def initialize(last_played_at, multiplayer, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_s
    "Game\'s last played at : #{@last_played_at} ~ Published on : #{@publish_date} ~ Multiplayer: #{@multiplayer ? 'Yes' : 'No'}"
  end

  def can_be_archived?
    diff = Time.diff(Time.parse(Date.today) - Time.parse(last_played_at))
    true if diff.years > 2
    false
  end
end
# rubocop:enable Layout/LineLength
