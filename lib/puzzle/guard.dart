
import 'block.dart';

class Guard extends Block{

  Guard({
    required String imagePath,
  }) : super(
    imagePath: imagePath,
    walls: const Walls(),
    selected: false,
    onTap: null,
    movable: false,
  );

}
