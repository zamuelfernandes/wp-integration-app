// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wp_integration_app/models/model_author.dart';
import 'package:wp_integration_app/models/model_post.dart';

class CustomPostData {
  Post postData;
  AuthorModel authorData;

  CustomPostData({
    required this.postData,
    required this.authorData,
  });
}
