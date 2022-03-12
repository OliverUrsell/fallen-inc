import 'package:fallen_inc/puzzle/puzzle.dart';
import 'package:flutter/material.dart';

class PuzzlePage extends StatefulWidget {

  final Puzzle puzzle;

  const PuzzlePage({Key? key, required this.puzzle}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/F1_background.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: widget.puzzle,
        ),
      ),
    );
  }
}
