
import 'dart:convert';

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
    "position": jsonEncode(position)
  };

  factory Player.fromJson(dynamic json){
    return Player(position: Block.fromJson(json["position"], (p0, p1) => null));
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
