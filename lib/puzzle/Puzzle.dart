
import 'package:flutter/material.dart';

import 'Block.dart';
import 'BlockWidget.dart';

class Puzzle extends StatefulWidget {
  const Puzzle({
    Key? key,
    required this.sizeX,
    required this.sizeY,
    required this.sizeRatio,
    required this.initialBlocks
  }) : super(key: key);

  final int sizeX, sizeY;
  final double sizeRatio;
  final List<List<Block?>> initialBlocks;

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {

  late List<List<Block?>> blockPositions;
  late List<Block> blocks;

  Block? selectedBlock;

  @override
  void initState() {
    super.initState();
    blockPositions = widget.initialBlocks;
    blocks = getAllBlocks();
  }

  double getBlockSize(Size screenSize){
    if(screenSize.width < screenSize.height){
      return (screenSize.height * widget.sizeRatio)/widget.sizeY;
    } else {
      return (screenSize.width * widget.sizeRatio)/widget.sizeX;
    }
  }

  bool setBlockPosition(Block block, int x, y) {
    // Returns False if the position isn't valid
    if (getBlockInPosition(x, y) != null) {
      return false;
    }

    blockPositions[block.y!][block.x!] = null;
    blockPositions[y][x] = block;
    block.x = x;
    block.y = y;

    return true;
  }

  void blockOnTap(int blockX, blockY){
    setState(() {
      selectedBlock = getBlockInPosition(blockX, blockY);
      print(selectedBlock!.x!.toString() + selectedBlock!.y!.toString());
      setBlockPosition(selectedBlock!, selectedBlock!.x!, (selectedBlock!.y! - 1) % 4);
    });
  }

  List<Block> getAllBlocks(){
    // TODO: Use list functions instead of these for loops
    List<Block> children = [];
    for (var list in blockPositions) {
      for (var block in list) {
        if (block != null) {
          children.add(block);
        }
      }
    }

    return children;
  }

  List<BlockWidget> getBlockWidgets(){
    return blocks.map((block) => block.getBlockWidget()).toList();
  }

  Block? getBlockInPosition(int x,y){
    return blockPositions[y][x];
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double blockSize = getBlockSize(screenSize);

    for(int y = 0; y < blockPositions.length; y++) {
      for(int x = 0; x < blockPositions[y].length; x++){
        Block? block = getBlockInPosition(x, y);
        if (block != null) {
          block.x = x;
          block.y = y;
          block.blockWidth = blockSize;
          block.blockHeight = blockSize;
          block.onTap = blockOnTap;
          block.selected = false;
        }
      }
    }

    if(selectedBlock != null){
      selectedBlock!.selected = true;
    }

    return SizedBox(
      width: blockSize * widget.sizeX,
      height: blockSize * widget.sizeY,
      child: Stack(
        children: getBlockWidgets()
      ),
    );
  }
}
