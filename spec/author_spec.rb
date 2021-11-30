Describe Author do
  context 'When creating a new instance of Author class' do
    it 'Should create a new Author' do
      new_author = Author.new( 'juan', 'Gonzalez')
      expect(new_author.id.type_of).to eq int
      expect(new_author.first_name).to eq 'Juan'
      expect(new_author.last_name).to eq 'Gonzalez'
    end
  end
end
