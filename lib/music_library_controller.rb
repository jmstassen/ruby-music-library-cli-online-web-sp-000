require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ""
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp
    end
  end

  def list_songs
    alphabetized_song_all = Song.all.sort_by(&:name)
    list_number = 1
    alphabetized_song_all.each do |song|
      puts "#{list_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      list_number += 1
    end
  end


#("1. Thundercat - For Love I Come - dance")
end
