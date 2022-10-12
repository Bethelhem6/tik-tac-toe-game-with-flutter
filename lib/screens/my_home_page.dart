import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> inputs = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  bool ohTurn = true;
  bool exTurn = false;
  int taps = 0;
  int scoreX = 0;
  int scoreO = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 41, 37),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Player O",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " $scoreO",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Player X",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " $scoreX",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade700, width: 1),
                        ),
                        child: Text(
                          inputs[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    const Text(
                      "TIK TAC TOE GAME",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "by BettyMisg6@gmail.com",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && inputs[index] == '') {
        inputs[index] = 'O';
        taps = taps + 1;
      } else if (!ohTurn && inputs[index] == '') {
        inputs[index] = 'X';
        taps = taps + 1;
      }
      print(taps.toString());
      ohTurn = !ohTurn;
      checkWinner(index);
    });
  }

  void checkWinner(int index) {
    if (inputs[0] == inputs[1] && inputs[0] == inputs[2] && inputs[0] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[0] == inputs[3] && inputs[0] == inputs[6] && inputs[0] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[3] == inputs[4] && inputs[3] == inputs[5] && inputs[3] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[6] == inputs[7] && inputs[6] == inputs[8] && inputs[6] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[1] == inputs[4] && inputs[1] == inputs[7] && inputs[1] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[2] == inputs[5] && inputs[2] == inputs[8] && inputs[2] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[0] == inputs[4] && inputs[0] == inputs[8] && inputs[0] != '') {
      showWinnerDialog(inputs[index]);
    }
    if (inputs[2] == inputs[4] && inputs[2] == inputs[6] && inputs[2] != '') {
      showWinnerDialog(inputs[index]);
    } else if (taps == 9) {
      showDarnDialog();
    }
  }

  void showWinnerDialog(String winner) {
    if (winner == 'O') {
      exTurn = false;
      ohTurn = true;
      scoreO = scoreO + 1;
    } else if (winner == 'X') {
      exTurn = true;
      ohTurn = false;
      scoreX = scoreX + 1;
    }
    showGeneralDialog(
        context: context,
        pageBuilder: ((context, animation, secondaryAnimation) {
          return AlertDialog(
            title: Text('Winner: "$winner"'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.green,
                    ),
                    Text(
                      "Play Again",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
    clearBoxs();
  }

  showDarnDialog() {
    showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: ((context, animation, secondaryAnimation) {
          return AlertDialog(
            title: const Text("Game Over"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.green,
                    ),
                    Text(
                      "Play Again",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              )
            ],
          );
        }));
    clearBoxs();
  }

  clearBoxs() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        inputs[i] = '';
      }
      taps = 0;
    });
  }
}
