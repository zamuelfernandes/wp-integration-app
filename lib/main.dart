import 'package:flutter/material.dart';
import 'package:wp_integration_app/models/model_post.dart';
import 'package:wp_integration_app/screen/home.dart';

import 'api/wp_datarequest.dart';

//import 'package:wordpress_api/wordpress_api.dart';

void main() async {
  // final api = WordPressAPI('https://www.guiadoscuriosos.com.br');

  // try {
  //   final res = await api.posts.fetch();

  //   print(res.data);
  //   for (final post in res.data as List<Post>) {
  //     debugPrint(post.content);
  //   }
  // } catch (e) {
  //   debugPrint(e.toString());
  // }

  Future<Map<String, List<Post>>> request() async {
    Map<String, List<Post>> postPerCategorie = {};
    try {
// final myRequest = WPDataRequest(site: 'https://www.guiadoscuriosos.com.br');
      final myRequest = WPDataRequest(site: 'https://www.emporiodomus.com.br');

      debugPrint(await myRequest.requestStatus()
          ? 'Connection Ok'
          : 'Connection Failed');

      // List<Post> list = await myRequest.getAllPosts();
      // debugPrint('$list \n${list.length}');

      postPerCategorie = await myRequest.getPostsPerCategories();
    } catch (e) {
      debugPrint(e.toString());
    }

    return postPerCategorie;
  }

  Map<String, List<Post>> posts = await request();

  runApp(
    HomeScreen(
      postsPerCategories: posts,
    ),
  );
}
