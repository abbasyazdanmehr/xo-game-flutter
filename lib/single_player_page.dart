import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xo/cell_type.dart';
import 'package:xo/widgets.dart';

class SinglePlayerPage extends StatefulWidget {
  const SinglePlayerPage({Key? key}) : super(key: key);

  @override
  State<SinglePlayerPage> createState() => _SinglePlayerPageState();
}

class _SinglePlayerPageState extends State<SinglePlayerPage> {
  double h = 0;
  double w = 0;

  final playerType = CellType.O;

  CellType turn = CellType.O;

  int scoreO = 0;
  int scoreX = 0;
  // even game 'o type' starts and odd game 'x type' starts the game
  int scorexo = 0; // show all game done!

  var winner = CellType.blank;

  List<CellType> cells = [
    CellType.blank,
    CellType.blank,
    CellType.blank,
    CellType.blank,
    CellType.blank,
    CellType.blank,
    CellType.blank,
    CellType.blank,
    CellType.blank,
  ];

  pageBody() {
    return Column(
      children: [
        const SizedBox(height: 20),
        gameBoard(),
        const SizedBox(height: 20),
        scoreBoard(),
      ],
    );
  }

  gameBoard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var j = 0; j < 3; j++) cell(i * 3 + j),
            ],
          )
      ],
    );
  }

  scoreBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        playerScore(CellType.O),
        playerScore(CellType.X),
      ],
    );
  }

  playerScore(CellType cellType) {
    return Container(
      width: w * 0.4,
      height: w * 0.1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white.withOpacity(0.8),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: cellType == CellType.O
            ? Text("O Score: $scoreO")
            : Text("X Score: $scoreX"),
      ),
    );
  }

  cell(int index) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          print("$index , $turn");

          if (cells[index] == CellType.blank) {
            insertInCell(index);
            changeTurn();
            showWinner();

            if (cells.contains(CellType.blank) && winner == CellType.blank) {
              appMove();
              changeTurn();
              showWinner();
            }
          }
        },
        child: cellUI(index),
      ),
    );
  }

  appMove() {
    if (cells[4] == CellType.blank) {
      insertInCell(4);
      return;
    }

    // rows x
    for (var i = 0; i < 3; i++) {
      int xes = 0;
      int oes = 0;
      int blankIndex = -1;

      for (var j = 0; j < 3; j++) {
        if (cells[3 * i + j] == CellType.X) {
          xes++;
        } else if (cells[3 * i + j] == CellType.O) {
          oes++;
        } else {
          blankIndex = 3 * i + j;
        }
      }

      if (blankIndex != -1 && xes == 2) {
        insertInCell(blankIndex);
        return;
      }
    }

    // rows o
    for (var i = 0; i < 3; i++) {
      int xes = 0;
      int oes = 0;
      int blankIndex = -1;

      for (var j = 0; j < 3; j++) {
        if (cells[3 * i + j] == CellType.X) {
          xes++;
        } else if (cells[3 * i + j] == CellType.O) {
          oes++;
        } else {
          blankIndex = 3 * i + j;
        }
      }

      if (blankIndex != -1 && oes == 2) {
        insertInCell(blankIndex);
        return;
      }
    }

    // columns x
    for (var i = 0; i < 3; i++) {
      int xes = 0;
      int oes = 0;
      int blankIndex = -1;

      for (var j = 0; j < 3; j++) {
        if (cells[i + 3 * j] == CellType.X) {
          xes++;
        } else if (cells[i + 3 * j] == CellType.O) {
          oes++;
        } else {
          blankIndex = i + 3 * j;
        }
      }

      if (blankIndex != -1 && xes == 2) {
        insertInCell(blankIndex);
        return;
      }
    }

    // columns o
    for (var i = 0; i < 3; i++) {
      int xes = 0;
      int oes = 0;
      int blankIndex = -1;

      for (var j = 0; j < 3; j++) {
        if (cells[i + 3 * j] == CellType.X) {
          xes++;
        } else if (cells[i + 3 * j] == CellType.O) {
          oes++;
        } else {
          blankIndex = i + 3 * j;
        }
      }

      if (blankIndex != -1 && oes == 2) {
        insertInCell(blankIndex);
        return;
      }
    }

    // diagonals
    if (cells[4] == cells[0] && cells[8] == CellType.blank) {
      insertInCell(8);
      return;
    }

    if (cells[4] == cells[8] && cells[0] == CellType.blank) {
      insertInCell(0);
      return;
    }

    if (cells[4] == cells[2] && cells[6] == CellType.blank) {
      insertInCell(6);
      return;
    }

    if (cells[4] == cells[6] && cells[2] == CellType.blank) {
      insertInCell(2);
      return;
    }

    if (cells[4] == CellType.X && cells[1] == CellType.blank) {
      insertInCell(1);
      return;
    }

    if (cells[0] == CellType.blank) {
      insertInCell(0);
      return;
    }

    if (cells[6] == CellType.blank) {
      insertInCell(6);
      return;
    }

    if (cells[2] == CellType.blank) {
      insertInCell(2);
      return;
    }

    if (cells[8] == CellType.blank) {
      insertInCell(8);
      return;
    }

    appRandomMove();
  }

  appRandomMove() {
    var rand = Random();
    while (true) {
      int cellIndex = rand.nextInt(9);
      if (cells[cellIndex] == CellType.blank) {
        insertInCell(cellIndex);
        break;
      }
    }
  }

  cellUI(int index) {
    return Container(
      width: w * 0.3,
      height: w * 0.3,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.black.withOpacity(0.8),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          ),
        ],
      ),
      child: cellContent(index),
    );
  }

  cellContent(int index) {
    if (cells[index] == CellType.blank) {
      return Container();
    } else if (cells[index] == CellType.O) {
      return Widgets.oIcon();
    } else {
      return Widgets.xIcon();
    }
  }

  insertInCell(int index) {
    if (turn == CellType.O) {
      cells[index] = CellType.O;
    } else {
      cells[index] = CellType.X;
    }
  }

  changeTurn() {
    if (turn == CellType.O) {
      turn = CellType.X;
    } else {
      turn = CellType.O;
    }
  }

  showWinner() {
    winner = findWinner();
    print("winner = $winner");
    if (winner != CellType.blank) {
      if (winner == CellType.O) {
        scoreO++;
      } else if (winner == CellType.X) {
        scoreX++;
      }
      scorexo++;

      _resultDialog(winner);
    }

    setState(() {});
  }

  Future<void> _resultDialog(CellType winner) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: winner == CellType.xo
              ? const Text("This is Draw! 😁")
              : Text(
                  "${winner.toString().substring(9)} player won the game! 🥳"),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                insertBlankInCells();
                print('scorexo = $scorexo');
                if (scorexo % 2 == 1) {
                  turn = CellType.X;
                  appMove();
                  changeTurn();
                } else {
                  turn = CellType.O;
                }

                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  insertBlankInCells() {
    for (var i = 0; i < cells.length; i++) {
      cells[i] = CellType.blank;
    }
  }

  findWinner() {
    if (cells[0] != CellType.blank) {
      if ((cells[0] == cells[1] && cells[0] == cells[2]) ||
          (cells[0] == cells[3] && cells[0] == cells[6])) {
        return cells[0];
      }
    }

    if (cells[4] != CellType.blank) {
      if ((cells[3] == cells[4] && cells[3] == cells[5]) ||
          (cells[1] == cells[4] && cells[1] == cells[7])) {
        return cells[4];
      }
    }

    if (cells[8] != CellType.blank) {
      if ((cells[6] == cells[7] && cells[6] == cells[8]) ||
          (cells[8] == cells[2] && cells[8] == cells[5])) {
        return cells[8];
      }
    }

    if (cells[4] != CellType.blank) {
      if ((cells[0] == cells[4] && cells[0] == cells[8]) ||
          ((cells[2] == cells[4] && cells[2] == cells[6]))) {
        return cells[4];
      }
    }

    int _blankCounter = 0;
    for (var mesh in cells) {
      if (mesh != CellType.blank) {
        _blankCounter++;
      }
    }

    if (_blankCounter == 9) {
      return CellType.xo;
    }

    return CellType.blank;
  }

  @override
  Widget build(BuildContext context) {
    double currentH = MediaQuery.of(context).size.height;
    double currentW = MediaQuery.of(context).size.width;
    h = currentH;
    w = currentW;

    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: Widgets.appBar1(),
      body: SingleChildScrollView(child: pageBody()),
    );
  }
}
