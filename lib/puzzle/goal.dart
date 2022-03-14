
import 'block.dart';

class Goal extends Block{

  Goal() : super(
    imagePath: "assets/MiniArella/arella_mini_forwards_1.png",
    walls: const Walls(),
    selected: false,
    onTap: null,
    movable: false,
    goal: true,
  );

}
