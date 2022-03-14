import 'dart:convert';

import 'block_widget.dart';

class Walls{
  final bool left, up, right, down;

  const Walls({this.left=true, this.up=true, this.right=true, this.down=true});

  Map toJson() => {
    "left": left,
    "up": up,
    "right": right,
    "down": down,
  };

  factory Walls.fromJSON(dynamic json){
    Map decodedJson = jsonDecode(json);
    return Walls(
      left: decodedJson["left"] as bool,
      up: decodedJson["up"] as bool,
      right: decodedJson["right"] as bool,
      down: decodedJson["down"] as bool,
    );
  }

}

class Block {

  double? blockWidth, blockHeight;

  int? x, y;

  String imagePath;

  Walls walls;

  bool selected, movable, goal, guard;

  Function(int, int)? onTap;

  Block({
    this.blockWidth,
    this.blockHeight,
    this.x,
    this.y,
    required this.imagePath,
    this.walls=const Walls(),
    this.selected = false,
    this.onTap,
    this.movable = true,
    this.goal = false,
    this.guard=false,
  });

  BlockWidget getBlockWidget(){
    return BlockWidget(
      blockWidth: blockWidth,
      blockHeight: blockHeight,
      x: x,
      y: y,
      imagePath: imagePath,
      selected: selected,
      onTap: onTap,
    );
  }

  Map toJson() => {
    "blockWidth": blockWidth,
    "blockHeight": blockHeight,
    "x": x,
    "y": y,
    "imagePath": imagePath,
    "walls": jsonEncode(walls),
    "movable": movable,
    "goal": goal,
    "guard": guard,
  };

  factory Block.fromJson(dynamic json, Function(int, int)? onTap) {
    return Block(
      blockWidth: json["blockWidth"] as double?,
      blockHeight: json["blockHeight"] as double?,
      x: json["x"] as int?,
      y: json["y"] as int?,
      imagePath: json["imagePath"] as String,
      walls: Walls.fromJSON(json["walls"]),
      movable: json["movable"] as bool,
      selected: false,
      goal: json["goal"],
      guard: json["guard"],
      onTap: onTap
    );
  }

}