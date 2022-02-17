import 'package:flutter/material.dart';
import 'package:pages_ui_prototype/models/models.dart' as models;
import 'package:pages_ui_prototype/widgets/widgets.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // change this structure to see changes in pages hierarchy
  static const _pages = [
    models.Page(
      title: 'page 1, level 1',
    ),
    models.Page(
      title: 'page 2, level 1',
      pages: [
        models.Page(
          title: 'page 3, level 2',
        ),
        models.Page(
          title: 'page 4, level 2',
          pages: [
            models.Page(
              title: 'page 5, level 3',
            ),
            models.Page(
              title: 'page 6, level 3',
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: const [
                SizedBox(
                  height: 100,
                ),
                Text('drag from here !'),
                CardItem(
                  draggableData: models.Page(
                    title: 'sample page',
                    pages: [],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('drop here !'),
              SizedBox(
                width: 300,
                child: _buildPages(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPages() {
    return const DragTargetItem(
      pages: _pages,
    );
  }
}
