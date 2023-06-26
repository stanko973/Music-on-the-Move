# Load the necessary libraries
library(tuneR)
library(lubridate)
library(scales)

# Set the working directory
setwd("/Music on the Move")

# Reading the audio files
audio_files <- list.files('Music on the Move', 
                          pattern="*.wav", full.names = TRUE)

# Selecting the audio file
audio_selected <- audio_files[1]

# Extracting the audio data from the file
audio_data <-  readWave(audio_selected)

# Extracting the sample rate of the audio
sample_rate <- audio_data@samp.rate

# Calculating the duration of the audio
duration <- nint(length(audio_data@left) / sample_rate)

# Calculating the song length in mins and secs
length_mins <- floor(duration / 60)
length_secs <- duration - (length_mins * 60)

# Extracting the sampling frequency
sample_freq <- audio_data@samp.rate

# Extracting the sampling Point
sample_point <- audio_data@left[1]

# Calculating the seconds the song starts
start_secs <- sample_point/sample_freq

# Calculating the minutes the song starts
start_mins <- floor(start_secs/60)

# Extracting the metadata of the song
audio_info <-  wavInfo(audio_selected)

#Extracting the artist name 
artist_name <- audio_info$artist

# Extracting the album name
album_name <- audio_info$album

# Extracting the title name
title_name <- audio_info$title

# Extracting the release year
year <- audio_info$year

# Extracting the genre
genre <- audio_info$genre

# Extracting the tempo
tempo <- audio_info$tempo

# Extracting the date when the track was added
date_added <- ymd(audio_info$date)

# Extracting the track volume
track_volume <- audio_info$volume

# Extracting the peak volume
peak_volume <- audio_info$peak

# Extracting the sampling rate
sampling_rate <- audio_info$samplingrate

# Calculating the overall volume of the track
overall_volume <- peak_volume*track_volume

# Create a dataframe
music_df <- data.frame(tracktitle = title_name, 
                       artist = artist_name,
                       album = album_name, 
                       year = year, 
                       genre = genre, 
                       tempo = tempo, 
                       dateadded = date_added,
                       volumetrack = track_volume,
                       volumpeak = peak_volume,
                       volumetotal = overall_volume,
                       samplerate = sampling_rate,
                       startmins = start_mins,
                       startsecs = start_secs,
                       lengthsecs = length_secs,
                       lengthmins = length_mins)

# Adjust the order of columns
music_df <- music_df[c("tracktitle", "artist", "album", "year",
                       "genre", "tempo", "dateadded",
                       "volumetrack", "volumpeak",
                       "volumetotal", "samplerate",
                       "startmins", "startsecs",
                       "lengthsecs", "lengthmins")]

# Summarizing the data
summary(music_df)

# Visualizing the data
ggplot(music_df, aes(x=genre, y=volumetotal)) +
  geom_boxplot() +
  labs(title="Volume of Tracks by Genre", 
       x="Genre", 
       y="Overall Volume")

# Writing the data into a file
write.table(music_df, file = "Music_on_the_Move.csv",
            row.names = FALSE, 
            col.names = TRUE, 
            sep = ",",
            quote = TRUE)