import 'package:flutter/material.dart';
import 'package:inshorts_clone/models/articles_list.dart';
import 'package:inshorts_clone/screens/loading_screen.dart';

import 'article_item.dart';

class NewsFeed extends StatefulWidget {

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  ArticlesList articlesList = ArticlesList();
  bool _isLoading = false;


  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async{
    setState(() {
      _isLoading = true; // fetching data
    });
    await articlesList.fetchData();

    setState(() {
      _isLoading = false; // data fetching complete
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: (_isLoading)? Center(child: LoadingScreen(),): PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: articlesList.articles.length,
          itemBuilder: (context, index){
          return ArticleItem(article: articlesList.articles[index],);
          }

      ),
    );
  }
}


