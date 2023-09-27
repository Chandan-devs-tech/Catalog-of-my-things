require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('Chandan', 'Gupta')
  end

  describe '#new' do
    it 'return the instance of Author class' do
      expect(@author).to be_an_instance_of(Author)
    end
  end

  describe '#firstname' do
    it 'return firstname of author' do
      expect(@author.first_name).to eq('Chandan')
    end
  end

  describe '#lastname' do
    it 'return lastname of author' do
      expect(@author.last_name).to eq('Gupta')
    end
  end

  describe '#items' do
    it 'return empty array for items' do
      expect(@author.items).to eq []
    end
  end

  describe '#add_item' do
    it 'adding item to the array of items' do
      mock_item = double('item')
      allow(mock_item).to receive(:author=).with(@author)
      @author.add_item(mock_item)
      expect(@author.items).to include(mock_item)
    end
  end
end
