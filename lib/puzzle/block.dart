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
    return Walls(
      left: json["left"] as bool,
      up: json["up"] as bool,
      right: json["right"] as bool,
      down: json["down"] as bool,
    );
  }

}

class Block {

  double? blockWidth, blockHeight;

  int? x, y;

  String imagePath;

  Walls walls;

  bool selected, movable;

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
      onTap: onTap
    );
  }

}