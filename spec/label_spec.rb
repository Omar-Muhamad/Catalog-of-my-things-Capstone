require_relative '../classes/label'

describe 'Create Label object' do
  context 'given the valid inputs' do
    before :each do
      @label = Label.new('Lord Of the Rings', 'gray')
      @item = Item.new(2000, true)
    end
    it 'should create a label with title = Lord of the Rings' do
      expect(@label.title).to eql('Lord Of the Rings')
    end
    it 'should create a label with gray color' do
      expect(@label.color).to eql('gray')
    end
    it 'should create a label with empty items array' do
      expect(@label.items).to match_array([])
    end
    
    it 'should create a label with ' do
      @label.add_item(@item)
      expect(@label.items.length).to eql(1)
    end
  end
end
