import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'block_widget.dart';

class Walls{
  final bool left, up, right, down;

  const Walls({this.left=true, this.up=true, this.right=true, this.down=true});
}

class Block {

  double? blockWidth, blockHeight;

  int? x, y;

  String imagePath;

  Walls walls;

  bool selected, movable;

  Function(int, int)? onTap;

  Block({
    Key? key,
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

}