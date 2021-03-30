package utils.nettyutil;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

public class SimpleNettyChatServer {
	
	private int port;
	
	public SimpleNettyChatServer(int port) {
		this.port = port;
	}
	
	public void run() throws Exception{
		EventLoopGroup bossGroup = new NioEventLoopGroup();
		EventLoopGroup workerGroup = new NioEventLoopGroup();
		try {
			ServerBootstrap bootstrap = new ServerBootstrap();
			bootstrap.group(bossGroup, workerGroup)
				.channel(NioServerSocketChannel.class)
				.childHandler(new SimpleChatServerInitializer())
				.option(ChannelOption.SO_BACKLOG, 128)
				.childOption(ChannelOption.SO_KEEPALIVE, true);
			
			System.out.println("SimpleNettyChatServer 啟動了!");
			
			ChannelFuture future = bootstrap.bind(port).sync();
			
			future.channel().closeFuture().sync();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			workerGroup.shutdownGracefully();
			bossGroup.shutdownGracefully();
			
			System.out.println("SimpleNettyChatServer 關閉了!");
		}
	}

	public static void main(String[] args) throws Exception  {
		new SimpleNettyChatServer(6000).run();

	}
}
