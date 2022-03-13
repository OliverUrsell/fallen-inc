
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'block.dart';

class Player {

  Block? position;

  Player({this.position});

  double getWidth(){
    return position!.blockWidth!;
  }

  double getHeight(){
    return position!.blockHeight!;
  }

  double getLeft(){
    return getWidth() * position!.x!;
  }

  double getTop(){
    return getHeight() * position!.y!;
  }

  Map toJson() => {
    "x": position!.x,
    "y": position!.y
  };

  Widget getWidget() {
    return AnimatedPositioned(
      width: getWidth(),
      height: getHeight(),
      left: getLeft(),
      top: getTop(),
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        child: Container(
          width: getWidth(),
          height: getHeight(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/MiniArella/arella_mini_forwards_1.png"),
            )
          ),
        ),
      ),
    );
  }

}
