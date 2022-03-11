import 'package:fallen_inc/puzzle/block.dart';
import 'package:fallen_inc/puzzle/puzzle.dart';
import 'package:fallen_inc/puzzle/player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fallen Inc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Puzzle(sizeX: 3, sizeY: 3, sizeRatio: 0.4, mode:PuzzleMode.player,
          initialBlocks: [
            [Block(walls: const Walls(up:false, left: false)), Block(), Block(walls: const Walls(up:false, left: false))],
            [Block(walls: const Walls(up:false, down: false)), Block(walls: const Walls(left:false, right: false)), Block(walls: const Walls(up:false, down: false))],
            [Block(walls: const Walls(up:false, left: false)), Block(walls: const Walls(right:false, down: false)), null],
          ],
          player: Player(),
        ),
      ),
    );
  }
}
