// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:wp_integration_app/models/model_category.dart';
import 'package:wp_integration_app/models/custom_postData.dart';
import 'package:wp_integration_app/models/model_author.dart';
import 'package:wp_integration_app/models/model_post.dart';
import 'package:http/http.dart' as http;

class WPDataRequest {
  String site;
  String? _apiLink;

  WPDataRequest({
    required this.site,
  }) {
    _apiLink = '$site/wp-json/wp/v2/posts';
  }

  Future<bool> requestStatus() async {
    http.Response response = await http.get(Uri.parse(_apiLink!));

    try {
      if (response.statusCode == 200) {
        debugPrint('Status Code: ${response.statusCode}');
        return true;
      } else {
        debugPrint('Status Code: ${response.statusCode}');
        debugPrint(response.body.toString());
        return false;
      }
    } catch (e) {
      debugPrint('Cath an error in WPDataRequest - requestStatus:');
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<Post>> getAllPosts() async {
    const int numberOfPages = 1;
    //http.Response response = await http.get(Uri.parse('${_apiLink!}?page=1'));

    //PICK DE TOTAL NUMBER OF PAGES --------------------------------------------
    // try {
    //   numberOfPages =
    //       json.decode(response.headers["x-wp-totalpages"]!);

    //   debugPrint(numberOfPages.toString());
    // } catch (e) {
    //   debugPrint('Cath an error in WPDataRequest - getAllPosts: numberOfPages');
    //   debugPrint(e.toString());
    // }

    List<Post> allPosts = <Post>[];

    //PICK DE TOTAL NUMBER OF PAGES --------------------------------------------
    List<String> allPostsLinks = await getSelfPostsLinks(numberOfPages);

    for (int index = 0; index < allPostsLinks.length; index++) {
      http.Response post = await http.get(Uri.parse(allPostsLinks[index]));

      Post actualPost = postFromJson(post.body);
      allPosts.add(actualPost);
    }
    return allPosts;
  }

  Future<AuthorModel> getaAuthorById({required String id}) async {
    AuthorModel? author;

    http.Response authorResponse =
        await http.get(Uri.parse('$site/wp-json/wp/v2/users/$id'));

    author = authorModelFromJson(authorResponse.body);
    return author;
  }

  Future<CategoryModel> getaCategoryById({required String id}) async {
    CategoryModel? category;

    http.Response categoryResponse =
        await http.get(Uri.parse('$site/wp-json/wp/v2/categories/$id'));

    category = categoryModelFromJson(categoryResponse.body);
    return category;
  }

  Future<List<CustomPostData>> getCustomPosts() async {
    const int numberOfPages = 1;

    List<CustomPostData> allPosts = <CustomPostData>[];

    //PICK DE TOTAL NUMBER OF PAGES --------------------------------------------
    List<String> allPostsLinks = await getSelfPostsLinks(numberOfPages);

    for (int index = 0; index < allPostsLinks.length; index++) {
      http.Response post = await http.get(Uri.parse(allPostsLinks[index]));

      Post actualPost = postFromJson(post.body);
      AuthorModel actualAuthor =
          await getaAuthorById(id: actualPost.author.toString());

      CustomPostData actual = CustomPostData(
        postData: actualPost,
        authorData: actualAuthor,
      );
      allPosts.add(actual);
    }
    return allPosts;
  }

  //RETURN A MAP<STRINNG, LIS<POST>> PER CATEGORIE -----------------------------
  Future<Map<String, List<Post>>> getPostsPerCategories() async {
    List<Post> allPosts = await getAllPosts();
    Map<String, List<Post>> mappedPosts =
        groupBy(allPosts, (post) => '${post.categories[0]}');

    return mappedPosts;
  }

  Future<List<String>> getSelfPostsLinks(
    int numberOfPages,
  ) async {
    List<String> allPostsLinks = [];

    for (int page = 1; page <= numberOfPages; page++) {
      http.Response response =
          await http.get(Uri.parse('${_apiLink!}?per_page=15'));

      try {
        final data = List.castFrom(json.decode(response.body));
        // Future.delayed(
        //   const Duration(seconds: 5),
        //   () async {
        for (int index = 0; index < data.length; index++) {
          allPostsLinks.add(data[index]["_links"]["self"][0]["href"]);
          debugPrint('${data[index]["_links"]["self"][0]["href"]}');
        }
        //   },
        // );
      } catch (e) {
        debugPrint('Cath an error in WPDataRequest - getSelfPostsLinks:');
        debugPrint(e.toString());
      }
    }
    return allPostsLinks;
  }

  Future<String?> getPostImage(Post post) async {
    String postMediaJsonLink = post.links.wpFeaturedmedia[0].href;
    String? imageLink;

    try {
      http.Response response = await http.get(Uri.parse(postMediaJsonLink));

      final mediaData = json.decode(response.body);
      if (mediaData["guid"] != null) {
        imageLink = mediaData["guid"]["rendered"];
        if (imageLink!.contains('http://stag.')) {
          imageLink = null;
        }
      }
    } catch (e) {
      debugPrint('Cath an error in WPDataRequest - getPostImage:');
      debugPrint(e.toString());
    }

    return imageLink;
  }
}
