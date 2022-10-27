
import 'package:hive/hive.dart';

class SavedNews{
  static Box<dynamic> savedNews = Hive.box('SavedNews');
  List<dynamic> newsSaved = savedNews.get('newsSaved', defaultValue:  []);
  
   void saveNews(String title, String content, String url){
    Map<String, dynamic> newsToSave = {
      "title": title,
      "content": content,
      "url": url  
    };
    newsSaved.add(newsToSave);
    savedNews.put('newsSaved', newsSaved);
    print(newsSaved.length);
  }
}