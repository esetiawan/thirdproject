import 'package:flutter/material.dart';
import 'package:thirdproject/model/article.dart';
import 'package:thirdproject/detail_news.dart';

class NewsScreen extends StatelessWidget {
  static const routeName='/article_list';
  const NewsScreen({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        body: FutureBuilder<String> (
          future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
          builder: (context,snapshot){
            final List<Article> articles = parseArticles(snapshot.data);
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context,index) {
                  return _buildArticleItem(context, articles[index]);
                }
            );
          },
        ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(article.urlToImage, width:100),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap:() {
      Navigator.pushNamed(context,DetailNewsScreen.routeName,arguments:article);
    }
  );
}
