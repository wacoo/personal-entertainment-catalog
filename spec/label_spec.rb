require 'rspec'
require_relative '../label'

describe Label do
  let(:label) { Label.new('Mystery', 'Red') }

  describe '#initialize' do
    it 'creates a new Label instance' do
      expect(label).to be_a(Label)
    end

    it 'correctly sets the instance variables' do
      expect(label.instance_variable_get(:@title)).to eq('Mystery')
      expect(label.instance_variable_get(:@color)).to eq('Red')
      expect(label.instance_variable_get(:@items)).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      item = Item.new('2020-01-01')
      label.add_item(item)
      expect(label.instance_variable_get(:@items)).to include(item)
      expect(item.label).to eq(label)
    end
  end
end