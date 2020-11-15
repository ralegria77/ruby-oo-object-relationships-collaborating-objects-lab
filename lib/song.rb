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

    def self.new_by_filename(filename) # passed arg is a 3 element string that needs to be split up
        new_instance = filename.split(" - ") # now we have 3 element array that we can pick out of 
        song = self.new(new_instance[1]) # new song instance created from passed file
        artist = Artist.find_or_create_by_name(new_instance[0])
        song.artist = artist
        artist.add_song(song)
        song
    end


    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end
