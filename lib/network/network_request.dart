//
//
// import 'dart:convert';
// import 'package:bonsai_shop/model/post.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/src/foundation/isolates.dart';
// import 'package:http/http.dart' as http;
//
// class NetworkRequest  {
//   // static const String url = 'https://6371b81b078587786180da12.mockapi.io/products';
//
//   static List<Post> parsePost(String responseBody) {
//     var list = json.decode(responseBody) as List<dynamic>;
//
//     List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
//     return posts;
//   }
//
//   // tạo hàm fetch API
//   static Future<List<Post>> fetchPosts({int page = 1}) async {
//      final response = await http.get(Uri.parse('https://6371b81b078587786180da12.mockapi.io/products'));
//      if (response.statusCode ==  200) {
//        return compute(parsePost, response.body);
//      } else if (response.statusCode == 404) {
//        throw Exception('Not Found');
//      } else {
//        throw Exception('Can\'t get post');
//      }
//   }
// }

