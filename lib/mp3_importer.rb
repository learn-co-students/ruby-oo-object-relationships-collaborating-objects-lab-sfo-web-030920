require 'pry'
require_relative "./song"
class MP3Importer
    attr_accessor :path
    @@all = []
    def initialize(path)
        @path = path
        save
    end

    def save
        @@all << self
    end

    def files
        Dir.entries(@path).select {|file| file.include?(".mp3")}
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end
