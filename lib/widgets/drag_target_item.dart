import 'package:flutter/material.dart';
import 'package:pages_ui_prototype/models/models.dart' as models;

class DragTargetItem extends StatefulWidget {
  const DragTargetItem({
    required this.pages,
    this.level = 0,
    Key? key,
  }) : super(key: key);

  final List<models.Page> pages;
  final int level;

  @override
  _DragTargetItemState createState() => _DragTargetItemState();
}

class _DragTargetItemState extends State<DragTargetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue.withOpacity(0.2),
      child: Column(
        children: [
          ...widget.pages.map(
            (currentPage) {
              return Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 60.0,
                    child: _dragTarget(
                      color: Colors.blue,
                    ),
                  ),
                  if (widget.level < 2)
                    Positioned(
                      top: 0,
                      left: 61,
                      right: 0,
                      height: 60,
                      child: _dragTarget(
                        color: Colors.yellow,
                      ),
                    ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      if (currentPage.pages != null &&
                          currentPage.pages!.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(
                            left: 60,
                          ),
                          child: DragTargetItem(
                            pages: currentPage.pages!,
                            level: widget.level + 1,
                          ),
                        ),
                      Container(),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _dragTarget({
    required Color color,
  }) {
    return DragTarget<models.Page>(
      builder: (context, candidateData, rejectedData) {
        if (candidateData.isEmpty) {
          return Container();
        } else {
          return Container(
            color: color,
          );
        }
      },
      onWillAccept: (incomingModule) {
        if (incomingModule != null) {
          return true;
        } else {
          return false;
        }
      },
      onAccept: (incomingPage) {},
      onMove: (details) {},
    );
  }
}
