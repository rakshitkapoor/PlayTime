import 'package:flutter/material.dart';

import 'package:tictacktoe/resources/socket_methods.dart';
import 'package:tictacktoe/widgets/custom_button.dart';
import 'package:tictacktoe/widgets/custom_text.dart';
import 'package:tictacktoe/widgets/custom_textField.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
    }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              shadows: const [Shadow(color: Colors.blue, blurRadius: 40)],
              text: "Create Room",
              fontSize: size.height * 0.11,
            ),
            SizedBox(height: size.height * 0.03),
            CustomTextField(
              controller: _nameController,
              hintText: "Enter Your nickname",
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            CustomButton(
                onTap: () {
                  _socketMethods.createRoom(_nameController.text);
                  print(_nameController.text.toString());
                },
                text: "Create"),
          ],
        ),
      ),
    );
  }
}
