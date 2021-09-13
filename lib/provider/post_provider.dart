import 'package:abwaab_task/model/post_model.dart';
import 'package:abwaab_task/network/api.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {

  PostProvider() {
    _listenPosts();
  }

  List<PostModel> currentPosts ;

  void _listenPosts() async {
    currentPosts = await Api.getPosts();
    notifyListeners();
  }
}
