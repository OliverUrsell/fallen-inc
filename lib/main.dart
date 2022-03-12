import 'package:fallen_inc/puzzle/block.dart';
import 'package:fallen_inc/puzzle/puzzle.dart';
import 'package:fallen_inc/puzzle/player.dart';
import 'package:fallen_inc/puzzle/puzzle_page.dart';
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

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const CharacterSelector();
//   }
// }


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PuzzlePage(
      puzzle: Puzzle(sizeX: 3, sizeY: 3, sizeRatio: 0.4, mode:PuzzleMode.slider,
        initialBlocks: [
          [
            Block(imagePath: "assets/Level1/FI_L1_down_right.png", walls: const Walls(up:false, left: false),),
            Block(imagePath: "assets/Level1/FI_L1_down_right.png", movable: false),
            Block(imagePath: "assets/Level1/FI_L1_down_right.png", walls: const Walls(up:false, left: false))
          ],
          [
            Block(imagePath: "assets/Level1/FI_L1_left_right_finished.png", walls: const Walls(up:false, down: false)),
            Block(imagePath: "assets/Level1/F1_L1_up_down_finished.png", walls: const Walls(left:false, right: false)),
            Block(imagePath: "assets/Level1/FI_L1_left_right_finished.png", walls: const Walls(up:false, down: false))
          ],
          [
            Block(imagePath: "assets/Level1/FI_L1_down_right.png", walls: const Walls(up:false, left: false)),
            Block(imagePath: "assets/Level1/FI_L1_up_left_finished.png", walls: const Walls(right:false, down: false)),
            null
          ],
        ],
        player: Player(),
      ),
    );
  }
}