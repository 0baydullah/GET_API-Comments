import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:comment_api_call_get/model.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  Future<List<CommentModel>?> getData()async{

    try{
      
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/2/comments");
      var response = await http.get(url);

      if(response.statusCode == 200){
        List <CommentModel>  model = List<CommentModel>.from(jsonDecode(response.body).map((e) => CommentModel.fromJson(e)));
        return model;
      }

    }catch(e){
      print(e);
    }

    return null;
  }
}