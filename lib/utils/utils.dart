import 'package:flutter/material.dart';
import 'package:tictacktoe/resources/game_methods.dart';

const BASE_URL="https://playtime-5wu6.onrender.com";

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                GameMethods().clearBoard(context);
                Navigator.pop(context);
              },
              child: const Text("Play Again"),
            )
          ],
        );
      });
}
