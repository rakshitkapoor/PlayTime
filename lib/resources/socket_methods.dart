import 'socket_client.dart';

class SocketMethods{
  final _socketClient=SocketClient.instance.socket!;

  void createRoom(String nickname){
    print("Inside Create rooom");
    if(nickname.isNotEmpty){
      _socketClient.emit('createRoom',{
        'nickname':nickname
      });
    }
  }
}