import 'package:inshorts_clone/models/article.dart';
import 'package:inshorts_clone/services/feed_repository.dart';

class ArticlesList {
  //private
  List<Article> _list = [];
  FeedRepositoryImpl feedRepository = FeedRepositoryImpl();

  Future<void> fetchData()async {
    List<Article> list = await feedRepository.getNewsByCategory('general');
    if (list.isNotEmpty) {
      _list.clear();
      _list.addAll(list);
      print(_list.length);
    }
  }
  Future<void> fetchDataByTopic(String topic) async{
    List<Article> list = await feedRepository.getNewsByTopic(topic);
    if(list.isNotEmpty){
      _list.clear();
      _list.addAll(list);
      print(_list.length);
      // notifyListeners();
    }
  }

    List<Article> get articles => _list;
  }
