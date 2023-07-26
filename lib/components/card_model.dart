import 'package:flutter/material.dart';
import 'package:wp_integration_app/api/wp_datarequest.dart';
import 'package:wp_integration_app/models/model_author.dart';
import 'package:wp_integration_app/models/model_category.dart';
import 'package:wp_integration_app/models/model_post.dart';
import 'package:wp_integration_app/screen/view_post.dart';

class CardModel extends StatefulWidget {
  final Post post;
  const CardModel({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  final myRequest = WPDataRequest(site: 'https://www.emporiodomus.com.br');
  String? networkBackgroundImage;
  String? categoryName;
  String? authorgImage;
  String? authorName;

  @override
  void initState() {
    pickContent();
    super.initState();
  }

  void pickContent() async {
    //try {
    AuthorModel author =
        await myRequest.getaAuthorById(id: widget.post.author.toString());

    authorName = author.name;
    authorgImage = author.avatarUrls!["96"];
    // } catch (e) {
    //   debugPrint('Erro on factory the AuthorModel');
    //   debugPrint(e.toString());
    // }

    //try {
    CategoryModel category = await myRequest.getaCategoryById(
        id: widget.post.categories[0].toString());
    categoryName = category.name;
    // } catch (e) {
    //   debugPrint('Erro on factory the CategoryModel');
    //   debugPrint(e.toString());
    // }

    networkBackgroundImage = await myRequest.getPostImage(widget.post);

    //ARRUMAR AQUI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String title = 'Sem título';

    if (widget.post.title.rendered.length > 55) {
      title = '${widget.post.title.rendered.substring(0, 55)} ...';
    } else {
      title = widget.post.title.rendered;
    }

    String date = '';

    String dateFormatter(DateTime dataHora) {
      String dia = dataHora.day.toString().padLeft(2, '0');
      String mes = dataHora.month.toString().padLeft(2, '0');
      String ano = dataHora.year.toString();
      String hora = dataHora.hour.toString().padLeft(2, '0');
      String minuto = dataHora.minute.toString().padLeft(2, '0');

      return '$dia/$mes/$ano - $hora:$minuto';
    }

    date = dateFormatter(widget.post.date);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostViewModel(
              post: widget.post,
              networkImage: networkBackgroundImage,
              authorName: authorName,
              authorgImage: authorgImage,
              categoryName: categoryName,
            ),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                //TOP CONTEXT ------------------------------------------------------
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(networkBackgroundImage ??
                          'https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 6,
                            color: Colors.amber,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: SizedBox(
                              width: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  categoryName ??
                                      widget.post.categories[0].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //BOT CONTEXT ------------------------------------------------------
                Container(
                  width: 350,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //TITLE -----------------------------------------
                            SizedBox(
                              width: 190,
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              ),
                            ),
                            //SHARE -----------------------------------------
                            const Row(
                              children: [
                                Text(
                                  'Compartilhar',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.share,
                                    size: 15,
                                    color: Colors.amber,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //AUTOR -----------------------------------------
                            Row(
                              children: [
                                Card(
                                  shape: const CircleBorder(
                                    side: BorderSide(
                                        width: 1.5, color: Colors.orangeAccent),
                                  ),
                                  margin: EdgeInsets.zero,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            authorgImage ??
                                                'https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fHww&w=1000&q=80',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    // CircleAvatar(
                                    //   child: Text(authorName?[0] ?? '.'),
                                    // ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    authorName ?? widget.post.author.toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //DATA -----------------------------------------
                            Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
