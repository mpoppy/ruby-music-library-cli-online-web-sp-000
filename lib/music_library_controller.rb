
class MusicLibraryController

  attr_accessor :path

  def initialize(path = nil)
    self.path = path if path
    MusicImporter.new(path)
  end
end
