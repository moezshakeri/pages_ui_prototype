# pages_ui_prototype

A sample project to implement a prototype of building widgets hierarchy.

## Getting Started

to change building widgets, change `_pages` value in `app.dart` file :

```
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
```

This project using flutter draggable and dragTarget widgets.
Models are located in `/models/` folder.
Widgets are located in `/widgets/` folder.