import 'package:flutter/material.dart';
import 'package:tictacktoe/screens/game_screen.dart';

import 'socket_client.dart';

class SocketMethods{
  final _socketClient=SocketClient.instance.socket;

  void createRoom(String nickname){
    print("Inside Create rooom");
    if(nickname.isNotEmpty){
      _socketClient.emit('createRoom',{
        'nickname':nickname
      });
    }
  }
  void createRoomSuccessListener(BuildContext context){
    _socketClient.on('createRoomSuccess',(room){
      print(room); 
      Navigator.pushNamed(context,GameScreen.routeName);
    });
  }

}