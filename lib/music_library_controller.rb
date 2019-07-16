
class MusicLibraryController

  attr_accessor :path

  def initialize(path = nil)
    self.path = path if path
  end
end
