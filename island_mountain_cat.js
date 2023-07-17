//Music on the Move Program

//variable declaration 
let soundPlaying = false;
let soundLocation = '';
let soundName = '';
let songDuration = 0;
let songPosition = 0;
let soundObject = null;

//Helper functions
function getLocation() {
	//Retrieves the sound file's location
	return soundLocation;
}
function getName() {
	/* Retrieves the name of the sound file 
	currently playing */
	return soundName;
}
function getPosition() {
	//Retrieves position of sound file
	return songPosition;
}
function getDuration() {
	//Retrieves duration of sound file
	return songDuration;
}
function setPosition(newPosition) {
	//Sets the position of the sound file
	songPosition = newPosition;
}

// Event handler for playing a sound
function playSound(location, name) {
	if (!soundPlaying) {
		//set location and name
		soundLocation = location;
		soundName = name;
		//Create sound object
		soundObject = new Audio(location);
		//Set duration
		songDuration = soundObject.duration * 1000;
		//Play sound
		soundObject.play();
		//Update boolean
		soundPlaying = true;
	}
}

//Event handler for stopping the sound
function stopSound() {
	if (soundPlaying) {
		//Stop sound
		soundObject.stop();
		//Reset booleans and variables
		soundPlaying = false;
		soundLocation = '';
		soundName = '';
		songDuration = 0;
		songPosition = 0;
	}
}

//Event handler for pausing the sound
function pauseSound() {
	if (soundPlaying) {
		//Pause sound
		soundObject.pause();
		//Update boolean
		soundPlaying = false;
		//Update sound position
		songPosition = soundObject.currentTime * 1000;
	}
}

//Event handler for resuming the sound
function resumeSound() {
	if (!soundPlaying) {
		//Resume sound
		soundObject.play();
		//Update boolean
		soundPlaying = true;
		//Update sound position
		soundObject.currentTime = songPosition/1000;
	}
}

//Event handler for volume control
function adjustVolume(volume) {
	if (soundPlaying) {
		//Update sound volume
		soundObject.volume = volume;
	}
}

//Function to mute the sound
function muteSound() {
	if (soundPlaying) {
		//Mute the sound
		soundObject.muted = true;
	}
}

//Function to unmute the sound
function unmuteSound() {
	if (soundPlaying) {
		//Unmute the sound
		soundObject.muted = false;
	}
}