import 'package:flutter/material.dart';
import 'package:inshorts_clone/constant.dart';
import 'package:inshorts_clone/models/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;


  ArticleItem({this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: BoxConstraints(
            minWidth: double.maxFinite,
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xfff0f0f0),
                  image: DecorationImage(
                      image: NetworkImage(article.imageURL),
                    fit: BoxFit.cover
                  ),
                ),


              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(article.title, style: kTitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,),
                      SizedBox(height: 8.0,),
                      Text(article.content, style: kContentTextStyle,
                      overflow: TextOverflow.fade,
                      maxLines: 9,),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text('Swipe Left for more at ${article.source}/ ${article.publishedAt.toIso8601String()}',
                      style: kLinkTextStyle,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
