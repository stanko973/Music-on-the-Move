-- Music on the Move
-- A Lua Music App
 
-- initialization
local music = {}

-- Our music database
music.songs = {
  { title = "Uptown Funk" , artist = "Mark Ronson ft. Bruno Mars", length = 4.31 },
  { title = "Blank Space" , artist = "Taylor Swift", length = 3.53 },
  { title = "Viva La Vida" , artist = "Coldplay", length = 4.01 },
  { title = "Can't Stop" , artist = "Red Hot Chili Peppers", length = 4.29 },
  { title = "Cheerleader" , artist = "OMI", length = 2.52 },
  { title = "Rolling in the Deep" , artist = "Adele", length = 3.45 },
  { title = "Titanium" , artist = "David Guetta ft. Sia", length = 4.05 },
  { title = "Halo" , artist = "Beyonce", length = 3.44 },
  { title = "Lose Yourself" , artist = "Eminem", length = 5.19 },
  { title = "Hey Ya!" , artist = "Outkast", length = 3.58 },
}

-- Return the title of the song
function music:getTitle(index)
  return self.songs[index].title
end

-- Return the artist of the song
function music:getArtist(index)
  return self.songs[index].artist
end

-- Return the length of the song
function music:getLength(index)
  return self.songs[index].length
end

-- Shuffle songs
function music:shuffle()
  for i = #self.songs, 1, -1 do
    local j = math.random(i)
    self.songs[i], self.songs[j] = self.songs[j], self.songs[i]
  end
end

-- Play a song
function music:play(index)
  print("Playing "..music:getTitle(index).." by "..music:getArtist(index).." length "..music:getLength(index).." minutes")
end

-- Start playing songs
function music:start()
  music:shuffle()
  for i = 1, #music.songs do
    music:play(i)
  end
end

return music