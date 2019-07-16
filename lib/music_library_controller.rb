
class MusicLibraryController
  extend Concerns::Findable

  attr_accessor :path

  def initialize(path = './db/mp3s')
    self.path = path if path
    music = MusicImporter.new(path).import
  end

  def call
    input = " "
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
        if input == "list songs"
          list_songs
        elsif input == "list artists"
          list_artists
        elsif input == "list genres"
          list_genres
        elsif input == "list artist"
          list_songs_by_artist
        elsif input == "list genre"
          list_songs_by_genre
        end
    end
  end

  def list_songs
    counter = 0
      Song.all.sort{ |a,b| a.name <=> b.name}.each do |song|
        counter += 1
        puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    counter = 0
      Artist.all.sort{ |a,b| a.name <=> b.name}.each do |artist|
        counter += 1
        puts "#{counter}. #{artist.name}"
      end
  end

  def list_genres
    counter = 0
      Genre.all.sort{ |a,b| a.name <=> b.name}.each do |genre|
        counter += 1
        puts "#{counter}. #{genre.name}"
      end
  end
  # def list_songs_by_artist
  #   puts "Please enter the name of an artist:"
  #   artist_input = gets.strip
  #   artist = Artist.find_by_name(artist_input)
  #     artist.songs.each do |song|
  #       puts song
  #     end
  #         # artist_object = Artist.find_by_name(artist_input)
  #   #   artist_object.songs.each do |song|
  #   #     puts "#{song}"
  #   #   end
  # end

  def list_songs_by_artist
   puts "Please enter the name of an artist:"
   input = gets.strip

   if artist = Artist.find_by_name(input)
     artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
       puts "#{i}. #{s.name} - #{s.genre.name}"
     end
   end
 end

  def list_songs_by_genre

  end

end
