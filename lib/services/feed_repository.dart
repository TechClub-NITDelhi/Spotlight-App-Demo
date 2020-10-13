import 'dart:convert';

import 'package:inshorts_clone/global.dart';
import 'package:inshorts_clone/models/article.dart';
import 'package:http/http.dart' as http;

abstract class FeedRepository{

  Future<List<Article>> getNewsByTopic(String topic);
  Future<List<Article>> getNewsByCategory(String topic);
}

class FeedRepositoryImpl implements FeedRepository{
  @override
  Future<List<Article>> getNewsByCategory(String category) async{
    List<Article> list = [];
   String url = Global.baseURL + 'top-headlines?country=in&category=$category';
   final response = await http.get(url, headers: {'X-Api-Key': Global.apiKey});
   if(response.statusCode == 200){
     final responseBody = jsonDecode(response.body); // endpoint call --> status code == 200 --> body(string) --> json format
     print(responseBody); // json data --> article list
     final List data = responseBody['articles'].toList();

     //article --> json format; a --> normal object
     //article --> a
     data.forEach((article) {
       final Article a = Article(
         title: article['title'] ?? '' ,
         author: article['author']?? '',
         description: article['description']?? '',
         articleURL: article['url']?? 'https://www.google.com',
         imageURL: article['urlToImage'],
         content: article['content']?? '',
         publishedAt: DateTime.parse(article['publishedAt']),
         source: article['source']['name']?? '',
       );

       list.add(a);
     });

   }

   return list;
  }

  @override
  Future<List<Article>> getNewsByTopic(String topic) async{
    final String url = Global.baseURL +"everything?q=$topic";
    List<Article> list = [];

    try{
      final response = await http.get(url, headers: {"X-Api-Key": Global.apiKey});
      if(response.statusCode ==  200){
        final responseBody = jsonDecode(response.body);
        print(responseBody);
        final List data = responseBody['articles'].toList();
        data.forEach((article) {
          final Article a = Article(
            title: article['title'] ?? '',
            description: article['description'] ?? '',
            content: article['content'] ?? '',
            author: article['author'] ?? '',
            publishedAt:DateTime.parse(article['publishedAt']),
            imageURL: article['urlToImage'] ?? ' ',
            articleURL: article['url'] ?? 'https://www.google.com',
            source: article['source'] != null
                ? article['source']['name']
                : null,
          );
          list.add(a);
        });

      }
    }catch(error){
      print(error);
    }

    return list;
  }

}