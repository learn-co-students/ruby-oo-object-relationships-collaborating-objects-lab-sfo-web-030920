require 'pry'
require_relative './song'

class Artist
    attr_accessor :name

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

    def songs
        Song.all.select {|song| song.artist == self} 
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name_string)
        # find artist instance that has song
        if !Artist.all.detect {|artist| artist.name == name_string}
            artist = Artist.new(name_string)
            artist
        else
            Artist.all.detect {|artist| artist.name == name_string}
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end
