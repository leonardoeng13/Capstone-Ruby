require_relative './calculator'

class Game < Item
  attr_accessor :last_played_at, :multiplayer
  attr_reader :publish_date

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @calculator = Calculator.new
  end

  def can_be_archived?
    true if super.can_be_archive(self) && @calculator.check_date(last_played_at)
    false
  end
end
