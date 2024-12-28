import 'package:socket_io_client/socket_io_client.dart' as IO;
// singleton design architecture 

class SocketClient {
  late IO.Socket socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://192.168.1.2:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((data){
      print('Connected to socket server');
    });
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}