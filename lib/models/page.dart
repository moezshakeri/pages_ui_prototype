import 'package:equatable/equatable.dart';

class Page extends Equatable {
  const Page({
    required this.title,
    this.pages,
  });

  final String title;
  final List<Page>? pages;

  @override
  List<Object?> get props => [
        title,
        pages,
      ];
}
