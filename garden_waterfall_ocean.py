#importing necessary libraries
import os
import random
import urllib.request

#defining a function to create the music folder
def create_music_folder():
    music_folder = 'MusicOnTheMove'
    try:
        if not os.path.exists(music_folder):
            os.makedirs(music_folder)
    except OSError:
        print ("Error creating folder")
    return music_folder

#defining a function to download the music files
def download_music_files(music_folder):
    for file_name in os.listdir(music_folder):
        if file_name.endswith('.mp3'):
            urllib.request.urlretrieve('http://www.xyzmusic.com/' +file_name, os.path.join(music_folder, file_name))

#defining a function to create the playlist
def create_playlist(music_folder):
    playlist_file = os.path.join(music_folder, 'playlist.m3u')
    files = os.listdir(music_folder)
    random.shuffle(files)
    with open(playlist_file, 'w') as f:
        for file in files:
            if file.endswith('.mp3'):
              f.write(file + "\n")

#defining a main function
def main():
    music_folder = create_music_folder()
    download_music_files(music_folder)
    create_playlist(music_folder)

#calling the main function
if __name__ == '__main__':
    main()