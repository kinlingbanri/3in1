package utils.controller;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketThread extends Thread{
	private ServerSocket serverSocket = null;
	
	public SocketThread(ServerSocket serverScoket){
		try {
			if(null == serverSocket){
				this.serverSocket = new ServerSocket(6000);
				System.out.println("socket start");
			}
		} catch (Exception e) {
			System.out.println("Create SocketThread socket error");
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		while(true){
			try {
				if(serverSocket==null){
					break;
				}else if(serverSocket.isClosed()){
					break;
				}
				
				Socket socket = serverSocket.accept();

				if(null != socket && !socket.isClosed()){
					//处理接受的数据
					Thread t = new Thread(new SocketOperate(socket));
					t.start();
				}else{
					break;
				}
			}catch (Exception e) {
				System.out.println("SocketThread创建socket服务出错");
				e.printStackTrace();

			}
		}
	}
	
	public void closeSocketServer(){
		try {
			if(null!=serverSocket && !serverSocket.isClosed()){
				serverSocket.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
