require_relative '../classes/genre'
require_relative '../classes/item'

describe 'Genre Class' do
  before :each do
    @genre = Genre.new(1, 'Pop')
    @item = Item.new(2000, false)
  end

  it 'should validate genre id' do
    expect(@genre.id).to eq 1
  end

  it 'should validate genre name' do
    expect(@genre.name).to eq 'Pop'
  end

  it 'should validate an object is instance of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'should validate add_item method' do
    @genre.add_item(@item)
    expect(@genre.items.length).to eq 1
  end
end
