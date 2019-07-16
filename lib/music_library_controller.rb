
class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    self.path = path if path
    MusicImporter.new(path)
  end
end
