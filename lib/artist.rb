class Artist

    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|name| name.artist == self}
    end

    def add_song(songobject)
        songobject.artist = self
    end

    def self.find_artist(string)
        Artist.all.find {|artist| artist.name == string}
    end

    def self.find_or_create_by_name(name)
        if !self.find_artist(name)
            artist = Artist.new(name)
            artist
        else
            self.find_artist(name)
        end
    end

    def print_songs
        self.songs.select{|song| puts song.name}
    end


end