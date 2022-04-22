import 'package:flutter/material.dart';
import 'package:newsapp/models/articles_models.dart';
import 'package:newsapp/widgets_main_menu/title.dart';

class MainMenuArticles extends StatelessWidget {
  const MainMenuArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Title1(),
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/articles.json'),
              builder: (context, snapshot) {
                final List<Article> articles = parseArticles(snapshot.data);
                return Expanded(
                    child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return _buildArticleItem(context, articles[index]);
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
    );
  }
}
