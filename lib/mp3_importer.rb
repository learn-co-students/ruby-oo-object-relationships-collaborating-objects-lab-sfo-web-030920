class MP3Importer

    attr_accessor :path
    def initialize(filepath)
        @path = filepath
    end

    def files
        Dir.entries(@path).select {|f| !File.directory? f}
    end

    def import 
        files.map do |song|
            Song.new_by_filename(song)
        end
    end
end