import 'package:abwaab_task/model/post_model.dart';
import 'package:abwaab_task/network/api.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  PostProvider() {
    _listenPosts();
  }

  List<PostModel> _currentPosts;

  void _listenPosts() async {
    _currentPosts = await Api.getPosts();
    notifyListeners();
  }

  List<PostModel> get currentPosts => _currentPosts;
}
