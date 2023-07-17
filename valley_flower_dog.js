// this is a demo application for 'Music on the Move'

// declare global variables
let music;
let currentSong;
let songList;
let shuffleMode;
let repeatMode;
let playing;

// define the init function 
function init(){
  // set up the music source
  music = new Audio();
  // create the song list
  songList = ["song1.mp3","song2.mp3","song3.mp3"];
  // set the default song
  currentSong = 0;
  // set the default playing status
  playing = false;
  // set the default shuffle and repeat mode
  shuffleMode = false;
  repeatMode = false;
  // call the start function
  start();
}

// define the start function
function start(){
  // set the song to the current song
  music.src = songList[currentSong];
  // set the playing status to true
  playing = true;
  // play the song
  music.play();
}

// define the toggleShuffleMode function
function toggleShuffleMode(){
  // toggle the shuffle mode
  if (shuffleMode){
    shuffleMode = false;
  } else {
    shuffleMode = true;
  }
}

// define the toggleRepeatMode function
function toggleRepeatMode(){
  // toggle the repeat mode
  if (repeatMode){
    repeatMode = false;
  } else {
    repeatMode = true;
  }
}

// define the nextSong function
function nextSong(){
  // check if shuffle mode is enabled
  if (shuffleMode){
    // generate a random number between 0 and the length of the song list
    let randomNumber = Math.floor(Math.random() * songList.length);
    // set the current song to the random number
    currentSong = randomNumber;
  // check if repeat mode is enabled
  } else if (repeatMode){
    // set the current song back to the beginning
    currentSong = 0;
  // otherwise
  } else {
    // increase the current song by one
    currentSong++;
    // check if the current song is greater than the length of the song list
    if (currentSong > songList.length){
      // set the current song back to the beginning
      currentSong = 0;
    }
  }
  // call the start function
  start();
}

// define the previousSong function
function previousSong(){
  // decrease the current song by one
  currentSong--;
  // check if the current song is less than 0
  if (currentSong < 0){
    // set the current song to the last song in the list
    currentSong = songList.length - 1;
  }
  // call the start function
  start();
}

// define the pause function
function pause(){
  // pause the song
  music.pause();
  // set the playing status to false
  playing = false;
}

// define the resume function
function resume(){
  // play the song
  music.play();
  // set the playing status to true
  playing = true;
}

// call the init function
init();