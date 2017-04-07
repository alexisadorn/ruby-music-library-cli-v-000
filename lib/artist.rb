class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    #binding.pry
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
    #binding.pry
  end
end