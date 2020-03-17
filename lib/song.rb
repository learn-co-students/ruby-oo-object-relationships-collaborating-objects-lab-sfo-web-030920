class Song

    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        song = file.split(" - ") #Becomes an array with artist at 1st element, artist at 0 element
        newSong = Song.new(song[1]) 
        artist = Artist.new(song[0])
        newSong.artist = artist
        return newSong


    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name) 
        self.artist = artist
    end






end