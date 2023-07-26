import 'package:flutter/material.dart';
import 'package:wp_integration_app/models/model_post.dart';
import 'package:wp_integration_app/screen/home.dart';

import 'api/wp_datarequest.dart';

void main() async {

  Future<Map<String, List<Post>>> request() async {
    Map<String, List<Post>> postPerCategorie = {};
    try {
      final myRequest = WPDataRequest(site: 'https://www.emporiodomus.com.br');

      debugPrint(await myRequest.requestStatus()
          ? 'Connection Ok'
          : 'Connection Failed');

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
