
import 'block.dart';

class Levels {
  static Levels? mono;

  List<List<List<Block?>>> levels = [];

  Levels(){
    assert(mono == null, "Can't have more than one PubNub instance");
    mono = this;

    levels.add([
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
    ]);

  }

}