import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';

import 'home.dart';
class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  @override
  void getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.w600
              ),),
            Text("App",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),)
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(left:5,right: 5),
        child: ListView.builder(shrinkWrap:true,itemCount:articles.length,itemBuilder: (context,index){
          return BlogTile(
            imageURL: articles[index].urltoImage,
            title: articles[index].title,
            discrip:articles[index].discrip,
            url: articles[index].URL,
          );
        },),
      ),
    );
  }
}
