require 'pry'

class Artist
    attr_accessor :name

    @@all = [ ]

    def initialize(name)
        @name = name.strip
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        name = name.strip
        # if !(performers = @@all.select {|artist| artist.name.downcase.include?(name)} ).empty?
        #     performers.first
        # else
        #     Artist.new(name)
        # end
        @@all.each do |artist|
            return artist if artist.name.include?(name)
        end
        Artist.new(name)
    end

    def print_songs
        @@all.each do |artist|
            artist.songs.each do |songs|
                puts songs.name
            end
        end
    end
end