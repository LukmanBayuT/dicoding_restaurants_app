import 'package:flutter/material.dart';
import 'package:newsapp/const/const.dart';

class Title1 extends StatelessWidget {
  const Title1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: p1a,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Restaurants', style: h1),
          const SizedBox(
            height: 10,
          ),
          Text('Recommendation for you', style: h2)
        ],
      ),
    );
  }
}
