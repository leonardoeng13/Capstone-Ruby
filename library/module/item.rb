class Item
    attr_reader :genre, :author, :source, :label, :archived
    attr_accessor :id
  
    def initialize(publish_date)
      @id = Random.rand(1..1000)
      @publish_date = publish_date
      @archived = false
    end
  
    def add_genre(genre)
      @genre = genre
      genre.items.push(self) unless genre.items.include?(self)
    end
  
    def add_author(author)
      @author = author
      author.items.push(self) unless author.items.include?(self)
    end
  
    def add_source(source)
      @source = source
      source.items.push(self) unless source.items.include?(self)
    end
  
    def add_label(label)
      @label = label
      label.items.push(self) unless label.items.include?(self)
    end
  
    def move_to_archive
      @archived = can_be_archived?
    end
  
    def to_s
      "ID: #{@id}, Publish Date: #{@publish_date.strftime('%Y/%m/%d')}, Author: #{@author}, \
  Genre: #{@genre}, Source: #{@source}, Label: #{@label}"
    end
  
    def to_json(_args)
      {
        'id' => @id,
        'publish_date' => @publish_date.strftime('%Y/%m/%d'),
        'author_id' => @author.id,
        'genre_id' => @genre.id,
        'source_id' => @source.id,
        'label_id' => @label.id
      }
    end
  
    private
  
    def can_be_archived?
      (Time.now.year - @publish_date.year) > 10
    end
  end
  