import 'package:flutter/material.dart';
import 'package:inshorts_clone/models/articles_list.dart';
import 'package:inshorts_clone/widget/article_item.dart';
import 'package:swipedetector/swipedetector.dart';

import 'loading_screen.dart';

class SelectedTopicScreen extends StatefulWidget {
  final topic;

  SelectedTopicScreen({this.topic});

  @override
  _SelectedTopicScreenState createState() => _SelectedTopicScreenState();
}

class _SelectedTopicScreenState extends State<SelectedTopicScreen> {
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
    await articlesList.fetchDataByTopic(widget.topic);

    setState(() {
      _isLoading = false; // data fetching complete
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SwipeDetector(
        onSwipeRight: (){
          Navigator.of(context).pop();
        },
        child: (_isLoading)? Center(child: LoadingScreen(),): PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: articlesList.articles.length,
            itemBuilder: (context, index){
              return ArticleItem(article: articlesList.articles[index],);
            }

        ),
      )
    );
  }
}


