import 'package:flutter/material.dart';
import 'package:game/screens/game_screen.dart';
import 'package:game/utils/game.dart';
import 'package:game/widgets/game_botton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      backgroundColor: Color(0xffd26a6a),
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
                  color: Colors.blue.shade400,
                  width: 5,
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
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth / 2 -
                          21,
                      child: Hero(
                        tag: "Rock",
                        child: gameButton(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  Choice("Rock"),
                                ),
                              ),
                            );
                          },
                          "assets/rock.png",
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Paper",
                        child: gameButton(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  Choice("Paper"),
                                ),
                              ),
                            );
                          },
                          "assets/paper.png",
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Scisor",
                        child: gameButton(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  Choice("Scisor"),
                                ),
                              ),
                            );
                          },
                          "assets/scisor.png",
                          btnWidth,
                        ),
                      ),
                    ),
                  ],
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
                    color: Colors.blue.shade400,
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
