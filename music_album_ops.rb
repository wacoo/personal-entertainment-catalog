require_relative 'music_album'
require_relative 'persistence'

class MusicAlbumOps
  def initialize
    @albums = []
    @persist = Persistence.new
  end

  def message(item)
    puts ''
    puts "😭 No #{item} added! 😭"
    puts ''
    puts "Create a new #{item}"
    puts ''
  end

  def create_album_with_banner(app)
    puts ''
    puts '*************************************************'
    puts '*           CREATE A NEW MUSIC ALBUM            *'
    puts '*************************************************'
    puts ''
    create_album(app)
  end

  def create_album(app)
    if app.gnops.genres.empty?
      message('genre')
      app.gnops.create_genre
    end
    app.gnops.list_all_genres

    puts ''
    print 'Select genre:> '
    genre = gets.chomp.to_i

    if app.lops.labels.empty?
      message('label')
      app.lops.create_label
    end
    app.lops.list_all_labels
    puts ''
    print 'Select label:> '
    label = gets.chomp.to_i
    print 'Publish date:> '
    publish_date = gets.chomp
    print 'On spotify [Y/N]:> '
    spot = gets.chomp

    spotify = false
    album = nil
    spotify = true if spot.upcase == 'Y'

    if label >= 1
      album = MusicAlbum.new(spotify, publish_date)
      album.label = app.lops.labels[label - 1]
      album.genre = app.gnops.genres[genre - 1]
      @albums << album
    else
      puts 'Wrong input!'
    end
    album
  end

  def list_album_with_banner
    puts ''
    puts '*************************************************'
    puts '*              LIST ALL MUSIC ALBUMS             *'
    puts '*************************************************'
    list_all_albums
  end

  def list_all_albums
    if @albums.empty?
      puts ''
      puts '😭 No album added! 😭'
    end
    @albums.each_with_index do |album, idx|
      puts "#{idx + 1}) Album ID: #{album.id}, Title: #{album.label.title}, Genre: #{album.genre.name}, Publish date: #{album.publish_date}"
    end
  end

  def to_hash
    hash_albums = []
    @albums.each do |album|
      hb = {}
      hb['on_spotify'] = album.on_spotify
      hb['publish_date'] = album.publish_date
      hb['genre_name'] = album.genre.name
      hb['label_title'] = album.label.title
      hb['label_color'] = album.label.color
      hash_albums << hb
    end
    hash_albums
  end

  def to_obj(list)
    list.each do |hash|
      album = MusicAlbum.new(hash['on_spotify'], hash['publish_date'])
      album.genre = Genre.new(hash['genre_name'])
      album.label = Label.new(hash['label_title'], hash['label_color'])
      @albums << album
    end
  end

  def save_albums
    @persist.save('albums', to_hash)
  end

  def load_albums
    hash_list = @persist.load('albums')
    to_obj(hash_list)
  end
end
