require 'pry'
class Genre 
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def songs
    @songs
  end

  def artists
    list = songs.map {|song| song.artist}
    list.uniq
  end 
  
end  
