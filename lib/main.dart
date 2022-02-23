import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  static AudioCache player = AudioCache();

  final play = (int number) => player.play('note$number.wav');
  final getColor = (Color color) => MaterialStateProperty.all<Color>(color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Note(1, Colors.red, 'Do'),
                Note(2, Colors.orange, 'Re'),
                Note(3, Colors.yellow, 'Mi'),
                Note(4, Colors.green, 'Fa'),
                Note(5, Colors.blue, 'Sol'),
                Note(6, Colors.blue.shade900, 'Ra'),
                Note(7, Colors.purple, 'Ti'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Note extends StatelessWidget {
  //StatelessWidget constructor
  Note(this.noteNumber, this.noteColor, this.label);
  final int noteNumber;
  final Color noteColor;
  final String label;

  static AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    Future<AudioPlayer> Function(int) play =
        (int number) => player.play('note$number.wav');
    MaterialStateProperty<Color> Function(Color) getColor =
        (Color color) => MaterialStateProperty.all<Color>(color);

    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: getColor(noteColor),
        ),
        onPressed: () => play(noteNumber),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
