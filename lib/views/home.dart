import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories=new List<CategoryModel>();
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  @override
  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  void initState(){
    super.initState();
    categories=getCategories();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.only(top: 4),
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: ListView.builder(scrollDirection:Axis.horizontal,shrinkWrap:true, itemCount: categories.length,itemBuilder: (context, index){
                return CategoryTile(
                  imageURL: categories[index].imageURL,
                  categoryName: categories[index].categoryName,
                );
              }),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
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
            )
          ],
        ),
      )
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageURL,categoryName;
  CategoryTile({this.imageURL,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context)=>CategoryNews(
            category: categoryName.toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(left:5),
        child: Stack(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imageURL,width: 120,height: 60,fit:BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black12
              ),
              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {
  @override
  final String imageURL,title,discrip,url;
  BlogTile({this.imageURL,this.title,this.discrip,this.url});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.push(context,MaterialPageRoute(
         builder: (context)=>ArticleView(url)
       ));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.network(imageURL)),
            SizedBox(height: 2),
            Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 14
            ),),
            SizedBox(height:2),
            Text(discrip,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400
            ),),
            SizedBox(height:15)
          ],
        ),
      ),
    );
  }
}
