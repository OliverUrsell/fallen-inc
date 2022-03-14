
import 'block.dart';

class Goal extends Block{

  Goal() : super(
    imagePath: "assets/goal_room.png",
    walls: const Walls(up: false),
    selected: false,
    onTap: null,
    movable: false,
    goal: true,
  );

}
