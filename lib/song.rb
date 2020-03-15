require 'pry'
require_relative './artist'

class Song
    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        # parsed_file = filename.split(" - ")
        song_name = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        song = Song.new(song_name)
        artist_ins = Artist.new(artist_name)
        song.artist = artist_ins
        song
    end

    def artist_name=(artist_str)
        artist_ins = Artist.find_or_create_by_name(artist_str)
        # self.artist = artist_ins  # a method (.add_song) in Artist class already defined to do this function, just need to call it
        artist_ins.add_song(self) # this way better than the line above because it collaborates with Artist class

    end

end