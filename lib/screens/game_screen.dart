import 'package:flutter/material.dart';
import 'package:game/screens/home_screen.dart';
import 'package:game/utils/game.dart';
import 'package:game/widgets/game_botton.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);
  Choice gameChoice;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;

    String? robotChoice = Game.randomChoice();
    String robotChoicePath = "";
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "assets/rock.png";
        break;
      case "Paper":
        robotChoicePath = "assets/paper.png";
        break;
      case "Scisor":
        robotChoicePath = "assets/scisor.png";
        break;
      default:
    }

    String? palyer_choice;
    switch (widget.gameChoice.type) {
      case "Rock":
        palyer_choice = "assets/rock.png";
        break;
      case "Paper":
        palyer_choice = "assets/paper.png";
        break;
      case "Scisor":
        palyer_choice = "assets/scisor.png";
        break;
      default:
    }

    if (Choice.gameRule[widget.gameChoice.type]![robotChoice] == "You Win") {
      setState(() {
        Game.score++;
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SCORE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.score}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                      child: gameButton(null, palyer_choice!, btnWidth),
                    ),
                    Text(
                      "VS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                      ),
                    ),
                    gameButton(null, robotChoicePath, btnWidth),
                  ],
                ),
              ),
            ),
            Text(
              "${Choice.gameRule[widget.gameChoice.type]![robotChoice]}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                padding: EdgeInsets.all(16),
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  "Play Again",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {},
                padding: EdgeInsets.all(16),
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  "Rules",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
