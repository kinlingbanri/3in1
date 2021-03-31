package utils.Netty.httpUtil;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.http.*;

import java.net.URI;
import java.net.URISyntaxException;

public class HttpClient {

	public static void main(String[] args) {
		final HttpClientHandler httpClientHandler = new HttpClientHandler();
        EventLoopGroup group=new NioEventLoopGroup();
        Bootstrap client=new Bootstrap();
        client.group(group)
                .channel(NioSocketChannel.class)
                .option(ChannelOption.SO_KEEPALIVE,true)
                .handler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    protected void initChannel(SocketChannel ch) throws Exception {
                        ChannelPipeline pipeline = ch.pipeline();
                        //包含编码器和解码器:
                        // pipeline.addLast(new HttpClientCodec())等价于new HttpRequestEncoder()  + new HttpResponseDecoder()
                        //request编码
                        pipeline.addLast(new HttpRequestEncoder())
                       //respon解码
                        .addLast(new HttpResponseDecoder())
                        .addLast(new HttpObjectAggregator(10240))

                        .addLast(httpClientHandler);
                    }
                });
        try {
            ChannelFuture future = client.connect("localhost", 8080).sync();
            future.channel().writeAndFlush(httpParams()).sync();
            future.channel().closeFuture().sync();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            group.shutdownGracefully();
        }
        //服务端返回的结果
        System.out.println("服务端返回的结果\n" + httpClientHandler.getResponse());
	}
	
	/**
     * 构建FullHttpRequest 发送请求
     * @return
     * @throws URISyntaxException
     */
    private static FullHttpRequest httpParams() throws URISyntaxException {
        //URI uri = new URI("3in1/index.jsp?DID=123");
    	URI uri = new URI("http://127.0.0.1:8080/3in1/index.jsp?DID=123");
        FullHttpRequest request = new DefaultFullHttpRequest(
                HttpVersion.HTTP_1_1,
                HttpMethod.GET,
                uri.toASCIIString());
        return request;
    }

}
