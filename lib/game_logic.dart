import 'package:flutter/material.dart';
import 'package:sudoko/text_form_field_widget.dart';

class GameLogic {
  static const String word = 'fortnite';
  static const List<int> guess = [2,5];
  static String text = 'Playing';
  static Color color = Colors.white;

  List<Widget> createPuzzle(List<TextEditingController> myController) {
    List<Widget> formFields = [];
    for (int i = 0; i < word.length; i++) {
      formFields.add(
        TextFormFieldWidget(
          controller: myController[i],
          enabled: guess.contains(i) ? true : false,
        ),
      );
      if (!guess.contains(i)) myController[i].text = word[i];
    }
    return formFields;
  }

  void checkGameState(List<TextEditingController> myController) {
    for (int i = 0; i < guess.length; i++) {
      if (myController[guess[i]].text.toLowerCase() ==
          word[guess[i]].toLowerCase()) {
        text = 'Winner';
        color = Colors.green;
      } else {
        text = 'Loser';
        color = Colors.red;
        break;
      }
    }
  }
}
