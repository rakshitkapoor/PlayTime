import 'package:flutter/material.dart';
import 'package:tictacktoe/colors.dart';
import 'package:tictacktoe/screens/create_room_screen.dart';
import 'package:tictacktoe/screens/game_screen.dart';
import 'package:tictacktoe/screens/join_room_screen.dart';
import 'package:tictacktoe/screens/main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bg),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        GameScreen.routeName : (context) =>const GameScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
