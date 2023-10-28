require 'date'
require_relative '../item'
require_relative '../genre'
require_relative '../author'
require_relative '../label'
require_relative '../source'

describe Item do
  publish_date = Date.new(2010, 1, 1)
  item = Item.new(publish_date)

  context 'Initialization' do
    it 'has a random ID' do
      expect(item.id).to be_an(Integer)
    end

    it 'is not archived by default' do
      expect(item.archived).to be_falsey
    end

    it 'has a publish date' do
      expect(item.publish_date).to eq(publish_date)
    end
  end

  context 'Adding associations' do
    genre = Genre.new('action')
    author = Author.new('john', 'doe')
    label = Label.new('mandaga', 'blue')
    source = Source.new('nothing')

    it 'can add a genre' do
      item.add_genre(genre)
      expect(item.genre).to eq(genre)
      expect(genre.items).to include(item)
    end

    it 'can add an author' do
      item.add_author(author)
      expect(item.author).to eq(author)
      expect(author.items).to include(item)
    end

    it 'can add a label' do
      item.add_label(label)
      expect(item.label).to eq(label)
      expect(label.items).to include(item)
    end

    it 'can add a source' do
      item.add_source(source)
      expect(item.source).to eq(source)
      expect(source.items).to include(item)
    end
  end

  context 'Archiving' do
    it "can be archived if it's older than 10 years" do
      allow(Time).to receive(:now).and_return(Time.mktime(2023, 1, 1))
      item = Item.new('2010-01-01')
      expect(item.can_be_archived?).to be_truthy
    end

    it "can't be archived if it's not older than 10 years" do
      allow(Time).to receive(:now).and_return(Time.mktime(2023, 1, 1))
      item = Item.new('2022-01-01')
      expect(item.can_be_archived?).to be_falsey
    end

    it "can't be moved to archive if not eligible" do
      allow(Time).to receive(:now).and_return(Time.mktime(2023, 1, 1))
      item = Item.new('2022-01-01')
      item.move_to_archive
      expect(item.archived).to be_falsey
    end
  end
end
