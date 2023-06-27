# Initializing Music on the Move

# Define our song class
class Song
  attr_accessor :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end
end

# Define our playlist class
class Playlist
  def initialize
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def has_song?(song)
    @songs.any? { |s| s.name == song }
  end

  def duration
    @songs.inject(0) { |sum, song| sum + song.duration }
  end
end

# Define our music player class
class MusicPlayer
  def initialize
    @playlists = []
  end

  def add_playlist(playlist)
    @playlists << playlist
  end

  def play
    @playlists.each do |playlist|
      playlist.songs.each do |song|
        play_song(song)
      end
    end
  end

  def play_song(song)
    puts "Now playing #{song.name} by #{song.artist}..."
  end
end

# Create songs
song1 = Song.new("Clocks", "Coldplay", 246)
song2 = Song.new("Chasing Cars", "Snow Patrol", 225)
song3 = Song.new("Turn Up the Music", "Lemar", 234)

# Create a playlist
playlist1 = Playlist.new
playlist1.add_song(song1)
playlist1.add_song(song2)
playlist1.add_song(song3)

# Create a music player
music_player = MusicPlayer.new
music_player.add_playlist(playlist1)

# Play the music
music_player.play