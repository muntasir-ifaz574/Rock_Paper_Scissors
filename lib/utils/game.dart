import 'dart:math';

class Game {
  static int score = 0;
  static List<String> choices = ["Rock", "Paper", "Scisor"];
  static String? randomChoice() {
    Random random = Random();
    int robotChoiceIndex = random.nextInt(3);
    return choices[robotChoiceIndex];
  }
}

class Choice {
  String? type = "";

  static var gameRule = {
    "Rock": {
      "Rock": "It's a Draw",
      "Paper": "You Lose",
      "Scisor": "You Win",
    },
    "Paper": {
      "Rock": "You win",
      "Paper": "It's a Draw",
      "Scisor": "You Lose",
    },
    "Scisor": {
      "Rock": "You Lose",
      "Paper": "You win",
      "Scisor": "It's a Draw",
    },
  };
  Choice(this.type);
}
