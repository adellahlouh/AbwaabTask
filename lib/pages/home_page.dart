import 'package:abwaab_task/model/post_model.dart';
import 'package:abwaab_task/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostProvider postProvider;

  @override
  Widget build(BuildContext context) {

    postProvider = Provider.of<PostProvider>(context ,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
      ),
      body: postProvider.currentPosts!= null
          ? ListView.separated(
              padding: const EdgeInsets.all(4.0),
              itemBuilder: (_, index) {
                PostModel postModel = postProvider.currentPosts[index];
                return buildCardPost(postModel);
              },
              separatorBuilder: (_, index) {
                return const Divider();
              },
              itemCount: postProvider.currentPosts.length)
          : const Center(
            child: CircularProgressIndicator(),
          ),
    );
  }

  Widget buildCardPost(PostModel postModel) => Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          title: Text('${postModel.title}'),
          subtitle: Text('${postModel.body}'),
        ),
      );
}
