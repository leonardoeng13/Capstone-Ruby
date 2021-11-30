require_relative './calculator'

class Game < Item
  def initialize(id, genre, author, source, label, publish_date, archived, multiplayer, last_played_at)
    super(id, genre, author, source, label, publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @calculator = Calculator.new
  end

  def can_be_archived?
    true if super.can_be_archive(self) && @calculator.check_date(last_played_at)
    false
  end
end
