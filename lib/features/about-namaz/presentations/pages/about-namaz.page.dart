import 'package:flutter/material.dart';
import 'package:namazapp/core/services/html.service.dart';
import 'package:namazapp/features/about-namaz/datasources/about-namaz-local-data.dart';
import 'package:namazapp/features/about-namaz/models/preview-article.model.dart';

class AboutNamazPage extends StatefulWidget {
  @override
  _AboutNamazPageState createState() => _AboutNamazPageState();
}

class _AboutNamazPageState extends State<AboutNamazPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Намаз туралы'),
      ),
      body: this.buildContent(),
    );
  }

  Widget buildContent() {
    return FutureBuilder(
      future: AboutNamazLocalData().getData(),
      builder: (context, data) {
        if (data.hasData == true) {
          return Container(
            child: this.contentUI(data.data),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }

  Widget contentUI(List<PreviewArticleModel> articles) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: articles.length,
        itemBuilder: (_, index) => this.buildArticle(articles[index]),
      ),
    );
  }

  Widget buildArticle(PreviewArticleModel a) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              a.title,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(child: HtmlService.convertToHtml(a.text)),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
