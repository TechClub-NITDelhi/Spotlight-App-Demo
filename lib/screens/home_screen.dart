import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/category_screen.dart';
import 'package:inshorts_clone/widget/news_feed.dart';

class HomeScreen extends StatelessWidget {
  // final screens = [CategoryScreen(), NewsFeed()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index){
          return index == 1 ? CategoryScreen(): NewsFeed();
        },
      ),
    );
  }
}
