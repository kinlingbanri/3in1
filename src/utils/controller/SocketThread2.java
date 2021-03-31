package utils.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class SocketThread2  extends Thread {
	
	private static Socket socket=null;
	public static Socket getSocket() {
		return socket;
	}
	
	@Override
	public void run() {
		System.out.println("===== This is the socket program =====");
		try {
			ServerSocket serverSocket=new ServerSocket(6000);
			Socket socket=serverSocket.accept();
			InputStream inputStream=socket.getInputStream();
			OutputStream outputStream=socket.getOutputStream();
			Scanner in=new Scanner(inputStream);
			PrintWriter printWriter=new PrintWriter(outputStream);
			printWriter.write("Hello Enter BYE to exit!");
			boolean done=false;
			while(!done&&in.hasNextLine()){
				String line=in.nextLine();
				System.out.println(line);
				printWriter.println("ECHO:"+line);
				printWriter.flush();
				if (line.trim().equals("BYE")) {
					done=true;
				}
			}
			in.close();
			inputStream.close();
			outputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
