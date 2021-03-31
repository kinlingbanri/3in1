package utils.nettylistenerthread;

import java.io.IOException;

public class ChatServerThread extends Thread {
	
	private ChatServerClass chatServerClass = null;
	private int port;
	
	public ChatServerThread(int port) {
		this.port = port;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
	}



	public void closeSocketServer(){


	}
}
