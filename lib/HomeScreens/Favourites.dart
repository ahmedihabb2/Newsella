import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> color = [
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.cyan,
    Colors.amber,
    Colors.indigo
  ];
  Random random = Random();

  Color _getRandomColor() {
    return color[random.nextInt(color.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/hs.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Ihab",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                    children: [
                      Text('15min .', style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'LifeStyle',
                        style: TextStyle(color: _getRandomColor()),
                      )
                    ],
                  ),
                
              ],
            ),
          ],
        ),
        IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            onPressed: () {})
      ],
    );
  }

  Widget _newsRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: ExactAssetImage('assets/images/hs.jpg'),fit: BoxFit.cover),
          ),
          width: 124,
          height: 124,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Here will be the news title ',
                style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 16),
              ),
              Text('and here will be an abstract about the topic you are interested in',
              style: TextStyle(color: Colors.grey , fontSize: 16 , height: 1.25),
              )
            ],
          ),
        ),
      ],
    );
  }
}
