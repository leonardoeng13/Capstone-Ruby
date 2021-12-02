class Author
  attr_accessor :first_name, :last_name, :id
  attr_reader :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push item
    item.add_author self
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end

  def self.json_create(object)
    author = new(object['first_name'], object['last_name'])
    author.id = object['id']
    author
  end
end
