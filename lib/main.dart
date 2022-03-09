import 'package:fallen_inc/puzzle/Block.dart';
import 'package:fallen_inc/puzzle/Puzzle.dart';
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
        child: Puzzle(sizeX: 5, sizeY: 5, sizeRatio: 0.4, initialBlocks: [
          [Block(color: Colors.blue, movable: false,), Block(), null, Block(), Block()],
          [Block(), Block(), Block(), Block(), Block()],
          [Block(), Block(), null, Block(), Block()],
          [Block(), Block(), Block(), Block(), Block()],
          [Block(), Block(), Block(), Block(), Block()],
        ],),
      ),
    );
  }
}
