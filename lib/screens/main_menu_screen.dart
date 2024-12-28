import 'package:flutter/material.dart';
import 'package:tictacktoe/colors.dart';
import 'package:tictacktoe/screens/create_room_screen.dart';
import 'package:tictacktoe/screens/join_room_screen.dart';
import 'package:tictacktoe/widgets/custom_button.dart';
import 'package:tictacktoe/widgets/custom_text.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bg,
          title: Text("Tick-Tac-Toe"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(shadows: [
                  Shadow(color: Colors.blue, blurRadius: 10),
                  Shadow(color: Colors.pink, blurRadius: 30),
                  Shadow(color: Colors.green, blurRadius: 10)
                ], text: "PLAY-TIME", fontSize: size.width*0.16),
                SizedBox(height: size.height * 0.2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        onTap: () => createRoom(context), text: "Create Room"),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        onTap: () => joinRoom(context), text: "Join Room")
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
