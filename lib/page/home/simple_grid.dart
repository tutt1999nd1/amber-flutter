import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SimpleGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView Demo')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        //physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: false,
        children: [
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=5'),
          Image.network('https://picsum.photos/250?image=6'),
          Image.network('https://picsum.photos/250?image=7'),
          Image.network('https://picsum.photos/250?image=8'),
          Image.network('https://picsum.photos/250?image=9'),
          Image.network('https://picsum.photos/250?image=10'),
          Image.network('https://picsum.photos/250?image=11'),
          Image.network('https://picsum.photos/250?image=12'),
          Image.network('https://picsum.photos/250?image=13'),
          Image.network('https://picsum.photos/250?image=14'),
          Image.network('https://picsum.photos/250?image=15'),
          Image.network('https://picsum.photos/250?image=16'),
          Image.network('https://picsum.photos/250?image=17'),
          Image.network('https://picsum.photos/250?image=18'),
          Image.network('https://picsum.photos/250?image=19'),
        ],
      ),
    );
  }
}
