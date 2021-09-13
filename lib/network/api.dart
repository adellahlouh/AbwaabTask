import 'dart:convert';
import 'dart:io';
import 'package:abwaab_task/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String BASE_URL = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostModel>> getPosts() async {
    List<PostModel> postList = [];

    http.Response res = await http.get(
      Uri.parse(BASE_URL),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonArray;
      try {
        jsonArray = jsonDecode(res.body);
      } catch (e) {
        debugPrint("No get posts");
      }
      postList = jsonArray.map((e) => PostModel.fromJson(e)).toList() ?? [];
    }

    print('Posts length : ${postList.length}\n'
            ' Response status code : ${res.statusCode} ');
    return postList ?? [];
  }
}
