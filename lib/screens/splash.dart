import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tik_tac_toe/screens/my_home_page.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(
            child: Text(
              "TIK TAC TOE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
          AvatarGlow(
            endRadius: 60.0,
            child: Material(
              // Replace this child with your own
              elevation: 20.0,
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 40.0,
                child: Image.asset(
                  'lib/assets/icon.png',
                  height: 100,
                ),
              ),
            ),
          ),
          MaterialButton(
            color: Colors.white,
            minWidth: 150,
            height: 70,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            child: const Text(
              "PLAY NOW!",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
