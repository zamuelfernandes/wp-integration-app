// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:wp_integration_app/api/wp_datarequest.dart';
import 'package:wp_integration_app/models/model_post.dart';

class PostViewModel extends StatefulWidget {
  final Post post;
  final String? networkImage;
  final String? content;
  final String? categoryName;
  final String? authorgImage;
  final String? authorName;
  const PostViewModel({
    Key? key,
    required this.post,
    this.networkImage,
    this.content,
    this.categoryName,
    this.authorgImage,
    this.authorName,
  }) : super(key: key);

  @override
  State<PostViewModel> createState() => _PostViewModelState();
}

class _PostViewModelState extends State<PostViewModel> {
  // final myRequest = WPDataRequest(site: 'https://www.guiadoscuriosos.com.br');
  final myRequest = WPDataRequest(site: 'https://www.emporiodomus.com.br');

  @override
  Widget build(BuildContext context) {
    Widget image = Container();
    if (widget.networkImage != null) {
      image = SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Image(
          image: NetworkImage(widget.networkImage!),
          fit: BoxFit.cover,
        ),
      );
    }

    String pickContent(List<String> body) {
      String content = '';

      // for (String palavra in body) {
      //   if (palavra.length > content.length) {
      //     content = palavra;
      //   }
      // }

      content = body[0];

      return content;
    }

    List<String> body = widget.post.content.rendered.split('api.whatsapp');
    String? content = pickContent(body);

    // content = widget.post.content.rendered;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75,
          child: Text(
            'View Post\n${widget.post.title.rendered}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 70),
              child: Text(
                widget.post.title.rendered,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Center(
                child: Card(
                  elevation: 6,
                  color: Colors.amber,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      10,
                      20,
                      10,
                    ),
                    child: Text(
                      widget.categoryName ??
                          widget.post.categories[0].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                parse(content).body!.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
              //AUTOR -----------------------------------------
              child: Row(
                children: [
                  Card(
                    shape: const CircleBorder(
                      side: BorderSide(width: 1.5, color: Colors.orangeAccent),
                    ),
                    margin: EdgeInsets.zero,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.authorgImage ??
                                  'https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fHww&w=1000&q=80',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      widget.authorName ?? widget.post.author.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
