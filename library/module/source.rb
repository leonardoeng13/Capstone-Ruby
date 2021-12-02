class Source
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push item
    item.add_source self
  end

  def to_s
    @name
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    source = new(object['name'])
    source.id = object['id']
    source
  end
end
