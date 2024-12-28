import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictacktoe/provider/room_data_provider.dart';
import 'package:tictacktoe/resources/socket_methods.dart';
import 'package:tictacktoe/widgets/scoreboard.dart';
import 'package:tictacktoe/widgets/tictactoe_board.dart';
import 'package:tictacktoe/widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    print(
        "Player1: ${Provider.of<RoomDataProvider>(context).player1.nickname}");
    print(
        "Player2: ${Provider.of<RoomDataProvider>(context).player2.nickname}");

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          :  SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Scoreboard(),
                  TicTacToeBoard(),
                  Text('${roomDataProvider.roomData['turn']['nickname']}\'s Turn')
                ],
              ),
            ),
    );
  }
}