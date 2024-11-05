import 'package:flutter/material.dart';
import 'game_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> myController =
        List.generate(GameLogic.word.length, (i) => TextEditingController());
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                GameLogic.text,
                style: TextStyle(fontSize: 30, color: GameLogic.color),
              ),
              Form(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  runSpacing: 8,
                  children: GameLogic().createPuzzle(myController),
                ),
              ),
              SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      GameLogic().checkGameState(myController);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800]),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
