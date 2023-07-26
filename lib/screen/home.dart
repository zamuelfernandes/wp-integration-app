// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wp_integration_app/components/card_model.dart';
import 'package:wp_integration_app/models/model_post.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, List<Post>> postsPerCategories;
  const HomeScreen({
    Key? key,
    required this.postsPerCategories,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'WP INTEGRATION APP TEST',
        postsPerCategories: postsPerCategories,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, List<Post>> postsPerCategories;
  const MyHomePage({
    super.key,
    required this.title,
    required this.postsPerCategories,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cardsList = [];

  @override
  void initState() {
    widget.postsPerCategories.forEach((categoria, posts) {
      debugPrint('Categoria: $categoria');
      for (Post post in posts) {
        debugPrint(' - ${post.title.rendered}');
        cardsList.add(CardModel(post: post));
      }
      debugPrint('');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cardsList.length,
                itemBuilder: (context, index) {
                  Color? background = Colors.grey[300];
                  if (index % 2 == 0) background = Colors.grey[100];

                  return Container(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    color: background,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cardsList[index],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
