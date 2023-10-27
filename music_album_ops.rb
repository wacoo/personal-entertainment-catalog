require_relative 'music_album'

class MusicAlbumOps
  def initialize
    @albums = []
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
end
