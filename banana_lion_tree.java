import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MusicOnTheMove
{
    public static void main(String[] args) throws IOException
    {
        // get source file for music
        File source = new File("/music/source_music.mp3");
        // output file
        File destination = new File("/music/destination_music.mp3");
        
        // read file 
        List<Byte> musicData = new ArrayList<>();
        FileInputStream fis = new FileInputStream(source);
        BufferedInputStream bis = new BufferedInputStream(fis);
        DataInputStream dis = new DataInputStream(bis);
        while(dis.available() > 0)
        {
            musicData.add(dis.readByte());
        }
      
        dis.close();
        bis.close();
        fis.close();
        
        FileOutputStream fos = new FileOutputStream(destination);
        BufferedOutputStream bos = new BufferedOutputStream(fos);
        DataOutputStream dos = new DataOutputStream(bos);
        
        for(int i = 0; i < musicData.size(); i++)
        {
            dos.writeByte(musicData.get(i));
        }
        
        dos.close();
        bos.close();
        fos.close();
        
        System.out.println("Music moved to the destination successfully.");
    }
}