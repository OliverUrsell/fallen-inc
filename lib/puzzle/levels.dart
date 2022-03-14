
import 'block.dart';
import 'goal.dart';
import 'guard.dart';

class Levels {
  static Levels? mono;

  List<List<List<Block?>>> levels = [];

  Levels(){
    assert(mono == null, "Can't have more than one PubNub instance");
    mono = this;

    levels.add([
      [
        Block(imagePath: "assets/Level1/FI_L1_down_right.png", walls: const Walls(up:false, left: false),),
        Goal(),
        Block(imagePath: "assets/Level1/FI_L1_down_right.png", walls: const Walls(up:false, left: false))
      ],
      [
        Block(imagePath: "assets/Level1/FI_L1_left_right_finished.png", walls: const Walls(up:false, down: false)),
        null,
        Block(imagePath: "assets/Level1/FI_L1_left_right_finished.png", walls: const Walls(up:false, down: false))
      ],
      [
        Block(imagePath: "assets/Level1/FI_L1_down_right.png", walls: const Walls(up:false, left: false)),
        Block(imagePath: "assets/Level1/F1_L1_up_down_finished.png", walls: const Walls(left:false, right: false)),
        Block(imagePath: "assets/Level1/FI_L1_up_left_finished.png", walls: const Walls(right:false, down: false)),
      ],
    ]);

    levels.add([
      [
        Block(imagePath: "assets/Level2/level_2_down_right.png", walls: const Walls(up:false, left: false)),
        Block(imagePath: "assets/Level2/level_2_down_left.png", walls: const Walls(up:false, right: false)),
        Goal(),
        Block(imagePath: "assets/Level2/level_2_down_left.png", walls: const Walls(up:false, right: false)),
      ],
      [
        Block(imagePath: "assets/Level2/level_2_up_down.png", walls: const Walls(left:false, right: false)),
        Guard(imagePath: "assets/Level2/level 2 guard room.png"),
        Block(imagePath: "assets/Level2/level_2_down_right.png", walls: const Walls(up:false, left: false)),
        Block(imagePath: "assets/Level2/level_2_up_down.png", walls: const Walls(left:false, right: false)),
      ],
      [
        Block(imagePath: "assets/Level2/level_2_up_down.png", walls: const Walls(left:false, right: false)),
        Block(imagePath: "assets/Level2/level_2_left_right.png", walls: const Walls(up:false, down: false)),
        null,
        Block(imagePath: "assets/Level2/level_2_up_left.png", walls: const Walls(right:false, down: false)),
      ],
      [
        Block(imagePath: "assets/Level2/level_2_up_right.png", walls: const Walls(left:false, down: false)),
        null,
        Block(imagePath: "assets/Level2/level_2_up_left.png", walls: const Walls(right:false, down: false)),
        Block(imagePath: "assets/Level2/level_2_up_down.png", walls: const Walls(left:false, right: false)),
      ],
    ]);

  }

}