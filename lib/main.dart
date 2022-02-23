import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
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
  Note(this.noteNumber, this.noteColor, this.noteLabel);
  final int noteNumber;
  final Color noteColor;
  final String noteLabel;

  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(noteColor),
        ),
        onPressed: () => player.play('note$noteNumber.wav'),
        child: Text(
          noteLabel,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
