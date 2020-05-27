import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/html.dart';


class AutoPI {
  AutoPI() {
    var channel;
    if(kIsWeb)
      channel = HtmlWebSocketChannel.connect("ws://127.0.0.1:1234"); 
    else {
      channel = IOWebSocketChannel.connect("ws://127.0.0.1:1234"); 
     }
      
    var autopiStream = channel.stream.asBroadcastStream();
  
    autopiStream.listen((message) {  
      Map<String, dynamic> msg = jsonDecode(message);
      var pid = msg['pid'];
      var _value = msg['value']; 
      switch (pid) {
        case 'bbm' : {
          _controller0.sink.add(_value);
        }
        break;  
        case 'rpm' : {
            _controller1.sink.add(_value);
        }
        break; 
        default:
          break;
      }

    });
  }
  close(){
    _controller0.close();
    _controller1.close();
  } 
  final _controller0 = StreamController<int>.broadcast();
  final _controller1 = StreamController<int>.broadcast();

  Stream<int>  getStream(String pid) {
    if (pid == "1"){
      return _controller0.stream;
    }
    if (pid == "2"){
      return _controller1.stream;
    }
  }
}