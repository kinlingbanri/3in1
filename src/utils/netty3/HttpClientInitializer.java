package utils.netty3;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpContentDecompressor;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpRequestEncoder;
import io.netty.handler.codec.http.HttpResponseDecoder;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;


public class HttpClientInitializer  extends ChannelInitializer<SocketChannel>  {

	@Override
	protected void initChannel(SocketChannel ch) throws Exception {
		ChannelPipeline pipeline = ch.pipeline();
		pipeline.addLast("log", new LoggingHandler(LogLevel.INFO));
		
		pipeline.addLast("request-encoder", new HttpRequestEncoder());
		pipeline.addLast("response-decoder", new HttpResponseDecoder());
		
		pipeline.addLast("inflater", new HttpContentDecompressor());
		
		//HttpObjectAggregator会把多个消息转换为 一个单一的FullHttpRequest或是FullHttpResponse
        //p.addLast("aggregator", new HttpObjectAggregator(1048576));
		pipeline.addLast("handler", new HttpClientHandler());
	}

}
