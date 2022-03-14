
import 'dart:convert';

import 'package:fallen_inc/puzzle/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pubnub.dart';
import 'block.dart';
import 'block_widget.dart';
import 'levels.dart';

enum PuzzleMode{
  slider,
  player
}

class SlideMove{
  final int startX, startY, endX, endY;
  SlideMove({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY
  });

  Map toJson() => {
    "startX": startX,
    "startY": startY,
    "endX": endX,
    "endY": endY
  };

  factory SlideMove.fromJson(dynamic json) => SlideMove(
    startX: json["startX"],
    startY: json["startY"],
    endX: json["endX"],
    endY: json["endY"],
  );
}

class PlayerMove {
  final int x, y;

  PlayerMove({required this.x, required this.y});

  Map toJson() => {
    "x": x,
    "y": y,
  };

  factory PlayerMove.fromJson(dynamic json) => PlayerMove(
    x: json["x"],
    y: json["y"],
  );

}

class Puzzle extends StatefulWidget {
  const Puzzle({
    Key? key,
    required this.sizeRatio,
    required this.player,
    required this.mode,
    this.initialLevel=0,
  }) : super(key: key);

  final double sizeRatio;
  final PuzzleMode mode;
  final Player player;
  final int initialLevel;

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
final rKeySet = LogicalKeySet(
  LogicalKeyboardKey.keyR,
);
class UpIntent extends Intent {}
class DownIntent extends Intent {}
class LeftIntent extends Intent {}
class RightIntent extends Intent {}
class RestartIntent extends Intent {}

class _PuzzleState extends State<Puzzle> {

  final FocusNode _focusNode = FocusNode();

  late List<List<Block?>> blockPositions;
  late List<Block> blocks;

  Block? selectedBlock;

  late Player player;

  int get sizeX {
    return blockPositions[0].length;
  }

  int get sizeY {
    return blockPositions.length;
  }

  int? currentLevel;

  Map toJson() {
    return {
      "blockPositions": jsonEncode(blockPositions.map((List<Block?> row) {
        return jsonEncode(row.map((Block? b) {
          if (b == null){
            return "null";
          }
          return b.toJson();
        }).toList());
      }).toList()),
      "player": jsonEncode(player),
      "level": currentLevel,
    };
  }

  void setBlockPositions(List<List<Block?>> blockPositions){
    this.blockPositions = blockPositions;
    blocks = getAllBlocks();
  }

  void nextLevel(){
    setLevel(currentLevel! + 1);
  }

  void restart(){
    setLevel(currentLevel!);
    PubNubInteractor.mono!.publishMap(toJson());
  }

  void setLevel(int level){
    setState(() {
      currentLevel = level;
      List<List<Block?>> newBlockPositions = List.from(Levels.mono!.levels[level]);
      setBlockPositions(newBlockPositions);
      player.position = newBlockPositions[newBlockPositions.length-1][0];
      selectedBlock = null;
    });
  }

  void fromJson(dynamic json){
    setState(() {
      currentLevel = json["level"];
      List<List<Block?>> positions = [];
      for (String row in jsonDecode(json["blockPositions"]) as List){
        List<Block?> newRow = [];
        for(dynamic block in jsonDecode(row)) {
          if(block == "null"){
            newRow.add(null);
          } else {
            Block blockObject = Block.fromJson(block, widget.mode == PuzzleMode.slider ? blockOnTap : null);
            newRow.add(blockObject);
          }
        }

        positions.add(newRow);
      }
      setBlockPositions(positions);
      dynamic decodedPlayer = jsonDecode(json["player"]);
      player.position = getBlockInPosition(decodedPlayer["x"], decodedPlayer["y"]);
    });
  }

  void sliderSubscription(envelope){
    SlideMove move = SlideMove.fromJson(envelope.payload);
    setBlockPosition(getBlockInPosition(move.startX, move.startY)!, move.endX, move.endY);
  }

  void playerSubscription(envelope){
    PlayerMove move = PlayerMove.fromJson(envelope.payload);
    setPlayerPosition(move.x, move.y);
  }

  @override
  void initState() {
    super.initState();
    player = widget.player;
    setLevel(widget.initialLevel);

    PubNubInteractor.mono!.addMapListener((envelope) {
      if (envelope.payload == "request"){
        PubNubInteractor.mono!.publishMap(toJson());
        return;
      }
      fromJson(envelope.payload);
    });

    if(widget.mode == PuzzleMode.player){
      PubNubInteractor.mono!.addSliderListener(sliderSubscription);
    } else {
      PubNubInteractor.mono!.addPlayerListener(playerSubscription);
    }

    PubNubInteractor.mono!.publishMapRequest();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  double getBlockSize(Size screenSize){
    if(screenSize.width < screenSize.height){
      return (screenSize.height * widget.sizeRatio)/sizeY;
    } else {
      return (screenSize.width * widget.sizeRatio)/sizeX;
    }
  }

  bool playerUp() {
    if (!player.position!.walls.up) return false;
    if(player.position!.y! < 1) return false;
    Block? newBlock = getBlockInPosition(player.position!.x!, player.position!.y! - 1);
    if(newBlock == null) return false;
    if(!newBlock.walls.down) return false;
    return movePlayer(0, -1);
  }

  bool playerDown() {
    if (!player.position!.walls.down) return false;
    Block? newBlock = getBlockInPosition(player.position!.x!, player.position!.y! + 1);
    if(newBlock == null) return false;
    if(!newBlock.walls.up) return false;
    return movePlayer(0, 1);
  }

  bool playerLeft() {
    if (!player.position!.walls.left) return false;
    if(player.position!.x! < 1) return false;
    Block? newBlock = getBlockInPosition(player.position!.x!-1, player.position!.y!);
    if(newBlock == null) return false;
    if(!newBlock.walls.right) return false;
    return movePlayer(-1, 0);
  }

  bool playerRight() {
    if (!player.position!.walls.right) return false;
    Block? newBlock = getBlockInPosition(player.position!.x!+1, player.position!.y!);
    if(newBlock == null) return false;
    if(!newBlock.walls.left) return false;
    return movePlayer(1, 0);
  }

  bool movePlayer(int x, int y) {
    if(setPlayerPosition(player.position!.x! + x, player.position!.y! + y)){

      PlayerMove move = PlayerMove(x: player.position!.x!, y: player.position!.y!);

      PubNubInteractor.mono!.publishPlayer(move.toJson());

      return true;
    } else {
      return false;
    }
  }

  bool setPlayerPosition(int x, int y) {

    if (x < 0 || x >= sizeX || y < 0 || y >= sizeY) return false;

    Block? newPosition = getBlockInPosition(x, y);
    if(newPosition == null) return false;

    setState(() {
      player.position = newPosition;
    });

    if(newPosition.goal) {

      if(widget.mode == PuzzleMode.player) {
        PlayerMove move = PlayerMove(x: player.position!.x!, y: player.position!.y!);

        PubNubInteractor.mono!.publishPlayer(move.toJson());
      }

      nextLevel();
      return false;
    }

    return true;
  }

  bool selectedBlockUp() => moveSelectedBlock(0, -1);
  bool selectedBlockDown() => moveSelectedBlock(0, 1);
  bool selectedBlockLeft() => moveSelectedBlock(-1, 0);
  bool selectedBlockRight() => moveSelectedBlock(1, 0);

  bool moveSelectedBlock(int x, int y){
    // Adds x and y to the position of the selected block
    if(selectedBlock == null) return false;

    if(!selectedBlock!.movable) return false;

    SlideMove move = SlideMove(startX: selectedBlock!.x!, startY: selectedBlock!.y!, endX: selectedBlock!.x! + x, endY: selectedBlock!.y! + y);

    if(setBlockPosition(selectedBlock!, selectedBlock!.x! + x, selectedBlock!.y! + y)){
      PubNubInteractor.mono!.publishSlider(move.toJson());
    }
    return false;
  }

  bool setBlockPosition(Block block, int x, y) {

    if (0 > x || x >= sizeX || 0 > y || y >= sizeY) return false;

    // Returns False if the position isn't valid
    if (getBlockInPosition(x, y) != null) return false;

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
          block.onTap = widget.mode == PuzzleMode.slider ? blockOnTap : null;
          block.selected = false;
        }
      }
    }

    if(selectedBlock != null) selectedBlock!.selected = true;

    late final Map<Type, Action<Intent>>? actions;

    if(widget.mode == PuzzleMode.slider){
      actions = {
        UpIntent: CallbackAction(onInvoke: (e) => selectedBlockUp()),
        DownIntent: CallbackAction(onInvoke: (e) => selectedBlockDown()),
        LeftIntent: CallbackAction(onInvoke: (e) => selectedBlockLeft()),
        RightIntent: CallbackAction(onInvoke: (e) => selectedBlockRight()),
      };
    } else if (widget.mode == PuzzleMode.player) {
      actions = {
        UpIntent: CallbackAction(onInvoke: (e) => playerUp()),
        DownIntent: CallbackAction(onInvoke: (e) => playerDown()),
        LeftIntent: CallbackAction(onInvoke: (e) => playerLeft()),
        RightIntent: CallbackAction(onInvoke: (e) => playerRight()),
      };
    }

    actions![RestartIntent] = CallbackAction(onInvoke: (e) => restart());

    return FocusableActionDetector(
      focusNode: _focusNode,
      shortcuts: {
        upArrowKeySet: UpIntent(),
        downArrowKeySet: DownIntent(),
        leftArrowKeySet: LeftIntent(),
        rightArrowKeySet: RightIntent(),
        upKeySet: UpIntent(),
        downKeySet: DownIntent(),
        leftKeySet: LeftIntent(),
        rightKeySet: RightIntent(),
        rKeySet: RestartIntent()
      },
      actions: actions,
      child: Builder(
        builder: (context) {
          if (!_focusNode.hasFocus) FocusScope.of(context).requestFocus(_focusNode);

          List<Widget> children = [];
          children.addAll(getBlockWidgets());
          children.add(player.getWidget());

          return SizedBox(
            width: blockSize * sizeX,
            height: blockSize * sizeY,
            child: Stack(
                children: children,
            ),
          );
        },
      ),
    );
  }
}
