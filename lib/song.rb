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
        parsed_file = filename.split(" - ")
        song = Song.new(parsed_file[1])
        artist_ins = Artist.new(parsed_file[0])
        song.artist = artist_ins
        song
    end

    def artist_name=(artist_str)
        artist_ins = Artist.find_or_create_by_name(artist_str)
        Artist.add_song(self)
    end

end