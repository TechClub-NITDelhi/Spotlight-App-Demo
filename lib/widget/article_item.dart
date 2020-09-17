import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inshorts_clone/constant.dart';
import 'package:inshorts_clone/models/article.dart';
import 'package:intl/intl.dart';

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
                      image: NetworkImage(article.imageURL), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: kTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        article.description,
                        style: kContentTextStyle,
                        overflow: TextOverflow.fade,
                        maxLines: 9,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Swipe Left for more at ${article.source}/ ${DateFormat('MMMM d').format(article.publishedAt)}',
                        style: kLinkTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff0f0f0),
                        image: DecorationImage(
                            image: NetworkImage(article.imageURL),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(16),
                      color: Color(0xff000000).withOpacity(0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.content, maxLines: 1,
                          style: kFooterDescTextStyle,),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('Tap to read more', style:kFooterReadMoreTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
