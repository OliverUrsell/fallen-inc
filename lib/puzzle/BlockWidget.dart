import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockWidget extends StatefulWidget {

  final double? blockWidth, blockHeight;

  final int? x, y;

  final Color color;

  final bool selected;

  final Function(int, int)? onTap;

  BlockWidget({
    Key? key,
    this.blockWidth,
    this.blockHeight,
    this.x,
    this.y,
    this.color=Colors.red,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  _BlockWidgetState createState() => _BlockWidgetState();
}

class _BlockWidgetState extends State<BlockWidget> {

  final Color defaultBorder = Colors.black;
  final Color selectedBorder = Colors.blue;

  double getWidth(){
    return widget.blockWidth!;
  }

  double getHeight(){
    return widget.blockHeight!;
  }

  double getLeft(){
    return getWidth() * widget.x!;
  }

  double getTop(){
    return getHeight() * widget.y!;
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedPositioned(
      width: getWidth(),
      height: getHeight(),
      left: getLeft(),
      top: getTop(),
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(widget.x!, widget.y!);
          }
        },
        child: Container(
          width: getWidth(),
          height: getHeight(),
          decoration: BoxDecoration(
            color: widget.selected ? widget.color:Colors.blue,
            border: Border.all(width: 3, color: widget.selected ? selectedBorder : defaultBorder),
          ),
        ),
      ),
    );
  }
}
