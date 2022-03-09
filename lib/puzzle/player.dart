
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Block.dart';

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
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

}
