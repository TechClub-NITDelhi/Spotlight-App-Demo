import 'package:flutter/material.dart';
import 'package:inshorts_clone/models/articles_list.dart';

import 'article_item.dart';

class NewsFeed extends StatefulWidget {

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  ArticlesList articlesList = ArticlesList();


  @override
  void initState() {

    //TODO: Implement isLoading
    articlesList.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: articlesList.articles.length,
          itemBuilder: (context, index){
          return ArticleItem(article: articlesList.articles[index],);
          }

      ),
    );
  }
}


