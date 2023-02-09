import 'package:flutter/material.dart';

import 'package:flutter_application_2/MyStyle.dart';

class MyGameXO extends StatelessWidget {
  const MyGameXO({super.key});

  @override
  Widget build(BuildContext context) {
    return const Game();
  }
}

class Game extends StatefulWidget {
  const Game({super.key});

  String get title => "крестики нолики";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool isTurn = true;
  int oCount = 0;
  int xCount = 0;
  int count = 0;
  final Text oText = const Text("o",style: TextStyle(color: Colors.amber,),);

  List<String> changeXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  const Text(
                    "PlayerO",
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      oCount.toString(),
                      style: textStyle,
                    ),
                  )
                ]),
ElevatedButton(onPressed: () => _clearBoard() , child: const Text("restart"))
                ,Column(
                  children: [
                    const Text(
                      "PlayerX",
                      style: textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        xCount.toString(),
                        style: textStyle,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
          Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: changeXO.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext ctx, int index) {
                    return GestureDetector(
                      onTap: () => _setXorO(index),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(changeXO[index],style: xoStyle),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  void _setXorO(int i) {
    if (isTurn && changeXO[i] == '') {
      setState(() {
        changeXO[i] = 'o';
        isTurn = !isTurn;
      });
    } else if (!isTurn && changeXO[i] == '') {
      setState(() {
        changeXO[i] = 'x';
        isTurn = !isTurn;
      });
      count++;
      _checkWinner();
    }
  }

  void _checkWinner() {
    if (changeXO[0] == changeXO[1] &&
        changeXO[0] == changeXO[2] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }
    if (changeXO[3] == changeXO[4] &&
        changeXO[3] == changeXO[5] &&
        changeXO[3] != '') {
      _showDialog(winner: changeXO[3]);
    }
    if (changeXO[6] == changeXO[7] &&
        changeXO[6] == changeXO[8] &&
        changeXO[6] != '') {
      _showDialog(winner: changeXO[6]);
    }
    if (changeXO[0] == changeXO[3] &&
        changeXO[0] == changeXO[6] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }
    if (changeXO[1] == changeXO[4] &&
        changeXO[1] == changeXO[7] &&
        changeXO[1] != '') {
      _showDialog(winner: changeXO[1]);
    }
    if (changeXO[2] == changeXO[5] &&
        changeXO[2] == changeXO[8] &&
        changeXO[2] != '') {
      _showDialog(winner: changeXO[2]);
    }
    if (changeXO[0] == changeXO[4] &&
        changeXO[0] == changeXO[8] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }
    if (changeXO[2] == changeXO[4] &&
        changeXO[2] == changeXO[6] &&
        changeXO[2] != '') {
      _showDialog(winner: changeXO[2]);
    }
    
    if(count == 9){
      _showDialog(winnerExists: false);
      _clearBoard();
    }
  }

  void _showDialog({String winner = '', bool winnerExists = true}) {
   showDialog(context: context, builder: (context){
    return AlertDialog(title: Text(winnerExists ? 'winner: $winner' : 'no '),actions: [
      TextButton.icon(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.restart_alt), label: const Text("restart"))
    ],);
   });
   count = 0;
   _clearBoard(); 
   if(winner == 'o'){
    oCount++;

   }else if(winner == 'x'){
    xCount++;
   }
  }

  void _clearBoard() {
    for(int i = 0; i < 9 ;i++){
      changeXO[i] = ' ';
    }
    count = 0;
  }
}
