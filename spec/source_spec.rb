require './source'

describe Source do
  context 'Initialization' do
    let(:source_name) { 'Netflix' }
    let(:source) { Source.new(source_name) }

    it 'is an instance of Source' do
      expect(source).to be_an_instance_of(Source)
    end

    it 'is initialized properly with the provided name' do
      expect(source.name).to eq(source_name)
    end
  end

  context '#add_item' do
    let(:source) { Source.new('Hulu') }
    let(:movie) { double('Movie') }
    
    it 'adds an item to the source' do
      expect(movie).to receive(:source=).with(source)
      source.add_item(movie)
      expect(source.items).to include(movie)
    end
  end
end