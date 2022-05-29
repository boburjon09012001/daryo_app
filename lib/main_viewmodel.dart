import 'dart:convert';
import 'dart:io';
import 'package:daryo_app/models/news_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';


class MainViewModel extends ChangeNotifier{
  ApiResponse _apiResponse = ApiResponse.initial("Empty");
  List<Articles>  articlesList = [];

  ApiResponse get response{
    return _apiResponse;
  }

  List<Articles>  get articles{
    return articlesList;
  }


  Future<ApiResponse> fetchNews() async {

    String API_KEY = "d0b373b272be4dacaa071026e07f0680";

    String url = "https://newsapi.org/v2/everything"
        "?q=tesla"
        "&from=2022-04-27"
        "&sortBy=publishedAt"
        "&apiKey=$API_KEY";

    Uri myURL = Uri.parse(url);

    try {
      var response = await http.get(myURL);
      Map<String, dynamic> data = jsonDecode(response.body);

      articlesList.clear();

      articlesList = NewsResponse.fromJson(data).articles!;

      _apiResponse  = ApiResponse.success(articlesList);
    }catch(exception){
      if(exception is SocketException){
        _apiResponse =
            ApiResponse.error("Internet bilan muammo bor!");
      }
      else{
        _apiResponse = ApiResponse.error(exception.toString());
      }

    }


    return _apiResponse;
  }

}