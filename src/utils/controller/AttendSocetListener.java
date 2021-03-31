package utils.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AttendSocetListener implements ServletContextListener{
	
	private SocketThread socketThread;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if((null != socketThread) && (!socketThread.isInterrupted())){
			socketThread.closeSocketServer();
			socketThread.interrupt();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		if(null == socketThread){
			//新建线程类
			socketThread=new SocketThread(null);
			//启动线程
			socketThread.start();

		}
	}

}
