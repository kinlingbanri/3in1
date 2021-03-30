package utils.NettyCommon;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

public class NettyServerMain {

	public static void main(String[] args)  throws Exception {
		//bossGroup只处理连接请求，workGroup和客户端业务处理
        EventLoopGroup bossGroup = new NioEventLoopGroup(1);
        EventLoopGroup workGroup = new NioEventLoopGroup();

        try {
			//创建服务端的启动对象，设置参数
            ServerBootstrap bootstrap = new ServerBootstrap();
            bootstrap.group(bossGroup, workGroup)//设置两个线程组
            		.channel(NioServerSocketChannel.class)
                    //.channel(NioServerSocketChannel.class)//NioServerSocketChannel服务器通道
                    .option(ChannelOption.SO_BACKLOG, 128)//线程队列得到的连接个数
                    .childOption(ChannelOption.SO_KEEPALIVE, true)//设置保持活动连接状态
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        //创建通道测试对象
                        @Override
                        protected void initChannel(SocketChannel socketChannel) throws Exception {
                        //给pipeline管道设置处理器
                            socketChannel.pipeline().addLast(new NettyServerHandler());
                        }
                    });
            System.out.println("服务器 is ready...");

            //绑定端口并同步，生成一个ChannelFuture 对象
            //启动服务器，绑定端口
            ChannelFuture cf = bootstrap.bind(6000).sync();
            //对关闭通道监听
            cf.channel().closeFuture().sync();

        } finally {
            bossGroup.shutdownGracefully();
            workGroup.shutdownGracefully();
        }
    }

}
