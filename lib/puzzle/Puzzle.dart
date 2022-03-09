
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

final upArrowKeySet = LogicalKeySet(
  LogicalKeyboardKey.arrowUp,
);
final downArrowKeySet = LogicalKeySet(
  LogicalKeyboardKey.arrowDown,
);
final leftArrowKeySet = LogicalKeySet(
  LogicalKeyboardKey.arrowLeft,
);
final rightArrowKeySet = LogicalKeySet(
  LogicalKeyboardKey.arrowRight, 
);
final upKeySet = LogicalKeySet(
  LogicalKeyboardKey.keyW,
);
final downKeySet = LogicalKeySet(
  LogicalKeyboardKey.keyS,
);
final leftKeySet = LogicalKeySet(
  LogicalKeyboardKey.keyA,
);
final rightKeySet = LogicalKeySet(
  LogicalKeyboardKey.keyD,
);
class UpIntent extends Intent {}
class DownIntent extends Intent {}
class LeftIntent extends Intent {}
class RightIntent extends Intent {}

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

  bool selectedBlockUp() => moveSelectedBlock(0, -1);
  bool selectedBlockDown() => moveSelectedBlock(0, 1);
  bool selectedBlockLeft() => moveSelectedBlock(-1, 0);
  bool selectedBlockRight() => moveSelectedBlock(1, 0);

  bool moveSelectedBlock(int x, y){
    // Adds x and y to the position of the selected block
    if(selectedBlock == null) {
      return false;
    }

    return setBlockPosition(selectedBlock!, selectedBlock!.x! + x, selectedBlock!.y! + y);
  }

  bool setBlockPosition(Block block, int x, y) {

    if (0 > x || x >= widget.sizeX || 0 > y || y >= widget.sizeY) {
      return false;
    }

    // Returns False if the position isn't valid
    if (getBlockInPosition(x, y) != null) {
      return false;
    }

    setState(() {
      blockPositions[block.y!][block.x!] = null;
      blockPositions[y][x] = block;
      block.x = x;
      block.y = y;
    });

    return true;
  }

  void blockOnTap(int blockX, blockY){
    setState(() {
      selectedBlock = getBlockInPosition(blockX, blockY);
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

    return FocusableActionDetector(
      autofocus: true,
      shortcuts: {
        upArrowKeySet: UpIntent(),
        downArrowKeySet: DownIntent(),
        leftArrowKeySet: LeftIntent(),
        rightArrowKeySet: RightIntent(),
        upKeySet: UpIntent(),
        downKeySet: DownIntent(),
        leftKeySet: LeftIntent(),
        rightKeySet: RightIntent(),
      },
      actions: {
        UpIntent: CallbackAction(onInvoke: (e) => selectedBlockUp()),
        DownIntent: CallbackAction(onInvoke: (e) => selectedBlockDown()),
        LeftIntent: CallbackAction(onInvoke: (e) => selectedBlockLeft()),
        RightIntent: CallbackAction(onInvoke: (e) => selectedBlockRight()),
      },
      child: SizedBox(
        width: blockSize * widget.sizeX,
        height: blockSize * widget.sizeY,
        child: Stack(
          children: getBlockWidgets()
        ),
      ),
    );
  }
}
