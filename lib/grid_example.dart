import 'package:flutter/material.dart';
import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";

class GridWidget extends StatelessWidget {
  GridWidget({super.key});

  static const appTitle = 'Grid View App';

  final List<String> images = [
    'pic1.jpg',
    'pic2.jpg',
    'pic3.jpg',
    'pic4.jpg',
    'pic5.jpg',
    'pic6.jpg',
    'pic7.jpg',
    'pic8.jpg',
    'pic9.jpg',
    'pic10.jpg',
    'pic11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: MasonryGridView.builder(
        itemCount: images.length,
        gridDelegate:
            SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            'images/${images[index]}',
            fit: BoxFit.cover,
          ),
          // child: Image.network(
          //   "https://images.unsplash.com/photo-1547721064-da6cfb341d50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=10",
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
