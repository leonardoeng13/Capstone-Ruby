# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/ParameterLists
require_relative '../../item'
require 'time_diff'

# Create class Game
class Game < Item
  attr_accessor :last_played_at, :multiplayer
  attr_reader :publish_date

  def initialize(id, genre, author, source, label, last_played_at, multiplayer, publish_date)
    super(id, genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_s
    "Game\'s last played at : #{@last_played_at} ~ Published on : #{@publish_date} ~ Multiplayer: #{@multiplayer ? 'Yes' : 'No'}"
  end

  def can_be_archived?
    diff = Time.diff(Date.parse(@last_played_at), Date.today)
    diff[:year] > 2 && super
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/ParameterLists
