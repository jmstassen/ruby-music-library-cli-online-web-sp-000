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
    alphabetized_song_all = Song.all.uniq.sort_by {|song| song.name}
    list_number = 1
    alphabetized_song_all.each do |song|
      puts "#{list_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      list_number += 1
    end
  end

  def list_songs
    alphabetized_song_all = Song.all.uniq.sort_by {|song| song.name}
    list_number = 1
    alphabetized_song_all.each do |song|
      puts "#{list_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      list_number += 1
    end
  end

  def list_artists
    alphabetized_artist_all = Artist.all.uniq.sort_by {|artist| artist.name}
    list_number = 1
    alphabetized_artist_all.each do |artist|
      puts "#{list_number}. #{artist.name}"
      list_number += 1
    end
  end

  def list_genres
    alphabetized_genre_all = Genre.all.uniq.sort_by {|genre| genre.name}
    list_number = 1
    alphabetized_genre_all.each do |genre|
      puts "#{list_number}. #{genre.name}"
      list_number += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    artist_requested = Artist.find_by_name(artist)
    if artist_requested != nil
      artist_songs_alphabetized = artist_requested.songs.sort_by {|song| song.name}
      list_number = 1
      artist_songs_alphabetized.each do |song|
        puts "#{list_number}. #{song.name} - #{song.genre}"
        list_number += 1
      end
    else
    end
end

#("1. Thundercat - For Love I Come - dance")
end
