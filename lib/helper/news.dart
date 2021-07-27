import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=0833546a0f5144b3a7a75edf4031d863";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"]!=null && element["description"]!=null)
          {
            ArticleModel articleModel=ArticleModel(
              title: element["title"],
              author: element["author"],
              content: element["content"],
              urltoImage: element["urlToImage"],
              discrip: element["description"],
              URL: element["url"],
            );
           news.add(articleModel);
          }
      });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String categories) async {
    String url="http://newsapi.org/v2/top-headlines?country=in&category="+categories+"&apiKey=0833546a0f5144b3a7a75edf4031d863";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"]!=null && element["description"]!=null)
        {
          ArticleModel articleModel=ArticleModel(
            title: element["title"],
            author: element["author"],
            content: element["content"],
            urltoImage: element["urlToImage"],
            discrip: element["description"],
            URL: element["url"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}