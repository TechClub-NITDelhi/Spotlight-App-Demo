import 'package:inshorts_clone/models/article.dart';
import 'package:inshorts_clone/services/feed_repository.dart';

class ArticlesList {
  //private
  List<Article> _list = [];
  FeedRepositoryImpl feedRepository = FeedRepositoryImpl();

  Future<void> fetchData()async {
    List<Article> list = await feedRepository.getNewsByCategory('general');
    _list = [];
    if(list.isNotEmpty){
      _list.addAll(list);
    }
  // _list = [
  // Article(
  // title:
  // 'Post-COVID care: Government recommends guidelines for home care and recovery - Times of India',
  // source: 'The Times of India',
  // author: 'TIMESOFINDIA.COM',
  // imageURL: 'https://static.toiimg.com/photo/78124262.cms',
  // articleURL:
  // 'https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/post-covid-care-government-recommends-guidelines-for-home-care-and-recovery/photostory/78123951.cms',
  // content:
  // 'Post-COVID care is something which needs attention, even after a person has tested negative for the virus. A lot of COVID patients are suggested to practice exercises, especially breathing exercises to improve respiratory distress and relieve congestion, even when they are in recovery. Post a negative A lot of COVID patients are suggested to practice exercises, especially breathing exercises to improve respiratory distress and relieve congestion, even when they are in recovery. Post a negative A lot of COVID patients are suggested to practice exercises, especially breathing exercises to improve respiratory distress and relieve congestion, even when they are in recovery. Post a negative',
  // publishedAt: DateTime.now(),
  // ),
  // Article(
  // title:
  // 'Post-COVID care: Government recommends guidelines for home care and recovery - Times of India',
  // source: 'The Times of India',
  // author: 'TIMESOFINDIA.COM',
  // imageURL: 'https://static.toiimg.com/photo/78124262.cms',
  // articleURL:
  // 'https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/post-covid-care-government-recommends-guidelines-for-home-care-and-recovery/photostory/78123951.cms',
  // content:
  // 'Post-COVID care is something which needs attention, even after a person has tested negative for the virus.',
  // publishedAt: DateTime.now(),
  // ),
  // Article(
  // title:
  // 'Post-COVID care: Government recommends guidelines for home care and recovery - Times of India',
  // source: 'The Times of India',
  // author: 'TIMESOFINDIA.COM',
  // imageURL: 'https://static.toiimg.com/photo/78124262.cms',
  // articleURL:
  // 'https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/post-covid-care-government-recommends-guidelines-for-home-care-and-recovery/photostory/78123951.cms',
  // content:
  // 'Post-COVID care is something which needs attention, even after a person has tested negative for the virus.',
  // publishedAt: DateTime.now(),
  // ),
  // Article(
  // title:
  // 'Post-COVID care: Government recommends guidelines for home care and recovery - Times of India',
  // source: 'The Times of India',
  // author: 'TIMESOFINDIA.COM',
  // imageURL: 'https://static.toiimg.com/photo/78124262.cms',
  // articleURL:
  // 'https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/post-covid-care-government-recommends-guidelines-for-home-care-and-recovery/photostory/78123951.cms',
  // content:
  // 'Post-COVID care is something which needs attention, even after a person has tested negative for the virus.',
  // publishedAt: DateTime.now(),
  // ),
  // Article(
  // title:
  // 'Post-COVID care: Government recommends guidelines for home care and recovery - Times of India',
  // source: 'The Times of India',
  // author: 'TIMESOFINDIA.COM',
  // imageURL: 'https://static.toiimg.com/photo/78124262.cms',
  // articleURL:
  // 'https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/post-covid-care-government-recommends-guidelines-for-home-care-and-recovery/photostory/78123951.cms',
  // content:
  // 'Post-COVID care is something which needs attention, even after a person has tested negative for the virus.',
  // publishedAt: DateTime.now(),
  // ),
  // Article(
  // title:
  // 'Post-COVID care: Government recommends guidelines for home care and recovery - Times of India',
  // source: 'The Times of India',
  // author: 'TIMESOFINDIA.COM',
  // imageURL: 'https://static.toiimg.com/photo/78124262.cms',
  // articleURL:
  // 'https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/post-covid-care-government-recommends-guidelines-for-home-care-and-recovery/photostory/78123951.cms',
  // content:
  // 'Post-COVID care is something which needs attention, even after a person has tested negative for the virus.',
  // publishedAt: DateTime.now(),
  // ),
  //
  //
  // ];
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
