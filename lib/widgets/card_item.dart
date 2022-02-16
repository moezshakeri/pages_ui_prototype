import 'package:flutter/material.dart';

class CardItem<T extends Object> extends StatelessWidget {
  const CardItem({
    Key? key,
    T? draggableData,
  })  : _draggableData = draggableData,
        super(key: key);

  final T? _draggableData;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: _draggableData,
      child: Container(
        height: 56.0,
        color: Colors.red.shade100,
      ),
      feedback: Container(
        width: 200,
        height: 50.0,
        color: Colors.grey.shade400,
      ),
    );
  }
}
