class Label
  attr_accessor :title, :color, :id
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push item
    item.add_label self
  end

  def to_s
    @title
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(object)
    label = new(object['title'], object['color'])
    label.id = object['id']
    label
  end
end
