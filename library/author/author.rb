require_relative 'corrector'

class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @corrector = Corrector.new
    private @id = (1...10_000).to_a.shuffle
    @first_name = @corrector.correct_name(first_name)
    @last_name = @corretor.correct_name(last_name)
    private @items = []
  end

  def add_item(item)
    @item.move_to_archive(self) if @item.can_be_archived?
    @items.push(item)
  end
end
