import java.util.*;
import java.io.*;

public class MusicOnTheMove {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int count = 0;
		
		// Prompt user for audio file
		System.out.println("Choose the audio file you would like to play: ");
		String audioFile = in.nextLine();
		
		// Load the audio file
		File file = new File(audioFile);
		if (!file.exists()) {
			System.out.println("Error: File does not exist!");
			return;
		}
		
		// Create an audio stream for the file
		AudioStream audioStream = new AudioStream(file);
		
		// Create a player object from the audio stream
		Player player = new Player(audioStream);
		
		// Play the file
		player.play();
		
		// Count the number of times the song has been played
		count++;
		
		// Prompt user to continue playing
		System.out.println("Would you like to continue playing the song? (y/n): ");
		String response = in.nextLine();
		
		// Continue playing until user responds with "n"
		while (!response.equalsIgnoreCase("n")) {
			if (response.equalsIgnoreCase("y")) {
				player.play();
				count++;
			}
			
			System.out.println("Would you like to continue playing the song? (y/n): ");
			response = in.nextLine();
		}
		
		// Print out the number of times the song was played
		System.out.println("The song was played " + count + " times.");
		
		// Close the player
		player.close();
		
		// Close the scanner
		in.close();
	}
	
	// Create a class for the audio stream
	public static class AudioStream {
		public AudioStream(File file) {
			// Code to load the audio file
		}
	}
	
	// Create a class for the player
	public static class Player {
		public Player(AudioStream stream) {
			// Code to create the player object
		}
		
		public void play() {
			// Code to play the audio file
		}
		
		public void close() {
			// Code to close the player
		}
	}
}