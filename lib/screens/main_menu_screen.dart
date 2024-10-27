import 'package:flutter/material.dart';
import 'package:tictacktoe/colors.dart';
import 'package:tictacktoe/screens/create_room_screen.dart';
import 'package:tictacktoe/screens/join_room_screen.dart';
import 'package:tictacktoe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName='/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context){
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context){
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bg,
          title: Text("Tick-Tac-Toe"),
        ),
        body: Padding(
          padding: EdgeInsets.all(size.width*0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(onTap: () => createRoom(context), text: "Create Room"),
              const SizedBox(height: 40,),
              CustomButton(onTap: () => joinRoom(context), text: "Join Room")
            ],
          ),
        ));
  }
}
