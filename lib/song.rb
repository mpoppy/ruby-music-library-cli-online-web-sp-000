
#create Song class, instatiate with a name
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    Song.new(name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    new_genre = genre.chomp(".mp3")
    new_song = self.create(song)
    new_song.artist = artist
    new_song.genre = new_genre
    new_song
  end

  def artist=(artist)
    @artist = artist
    Artist.add_song(self)
  end

  # def self.find_by_name(name)
  #   self.all.detect{|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
