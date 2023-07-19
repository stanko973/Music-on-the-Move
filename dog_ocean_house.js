// Music On The Move: Javascript Application
// Version 1.0

// Declare necessary variables
var audioElements = [];
var audioSource = [];
var currentSource = "";
var currentIndex = 0;

// Populate the audioElements and audioSource arrays
window.addEventListener("load", setup);
function setup() {
  var audioFiles = document.querySelectorAll("audio");
  for (let i = 0; i < audioFiles.length; i++) {
    audioElements.push(audioFiles[i]);
    audioSource.push(audioFiles[i].src);
  }
  currentSource = audioSource[0];
}

// Play the audio when the play button is clicked
document.getElementById("playButton").addEventListener("click", play);
function play() {
  document.querySelector("audio[src='" + currentSource + "']").play();
}

// Pause the audio when the pause button is clicked
document.getElementById("pauseButton").addEventListener("click", pause);
function pause() {
  document.querySelector("audio[src='" + currentSource + "']").pause();
}

// Rewind the audio when the rewind button is clicked
document.getElementById("rewindButton").addEventListener("click", rewind);
function rewind() {
  document.querySelector("audio[src='" + currentSource + "']").currentTime = 0;
}

// Change the audio source when the next button is clicked
document.getElementById("nextButton").addEventListener("click", next);
function next() {
  currentIndex++;
  if (currentIndex >= audioSource.length) {
    currentIndex = 0;
  }
  currentSource = audioSource[currentIndex];
  document.querySelector("audio[src='" + currentSource + "']").play();
}

// Change the audio source when the previous button is clicked
document.getElementById("previousButton").addEventListener("click", previous);
function previous() {
  currentIndex--;
  if (currentIndex < 0) {
    currentIndex = audioSource.length - 1;
  }
  currentSource = audioSource[currentIndex];
  document.querySelector("audio[src='" + currentSource + "']").play();
}

// Monitor the current playback time and show it in the progress bar
document.querySelector("audio").addEventListener("timeupdate", function () {
  var currentTime = document.querySelector("audio").currentTime;
  document.getElementById("progressBar").value = currentTime;
});