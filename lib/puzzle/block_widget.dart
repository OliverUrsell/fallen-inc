import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockWidget extends StatefulWidget {

  final double? blockWidth, blockHeight;

  final int? x, y;

  final String imagePath;

  final bool selected;

  final Function(int, int)? onTap;

  BlockWidget({
    Key? key,
    this.blockWidth,
    this.blockHeight,
    this.x,
    this.y,
    required this.imagePath,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  _BlockWidgetState createState() => _BlockWidgetState();
}

class _BlockWidgetState extends State<BlockWidget> {

  final Color defaultBorder = Colors.transparent;
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
      duration: const Duration(milliseconds: 200),
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
            image: DecorationImage(image: AssetImage(widget.imagePath)),
            border: Border.all(width: 3, color: widget.selected ? selectedBorder : defaultBorder),
          ),
        ),
      ),
    );
  }
}
