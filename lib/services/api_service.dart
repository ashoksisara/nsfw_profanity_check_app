import 'package:demo_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/response_model.dart';
import '../utils/reachability.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  static final ApiService instance = _instance;

  final Dio _dio = Dio();

  final String _baseUrl =
      'https://nsfw-images-detection-and-classification.p.rapidapi.com/adult-content';

  final Map<String, String> headers = {
    'content-type': 'application/json',
    'X-RapidAPI-Key': '7322406c43msh9f6162239b746e1p17bb5cjsn9f3304dd9242',
    'X-RapidAPI-Host': 'nsfw-images-detection-and-classification.p.rapidapi.com'
  };

  final Map<String, dynamic> body = {};

  //api calling to check nudity in image
  Future<ResponseModel?> checkNudity(BuildContext context, String? url) async {
    if(!Utils.isInternetAvailable(context)){
      return null;
    }
    body['url'] = url;
    debugPrint('_baseUrl : $_baseUrl');
    debugPrint('headers : $headers');
    debugPrint('body : $body');
    try {
      Response response = await _dio.post(_baseUrl,
          data: body, options: Options(headers: headers));
      debugPrint('response data : ${response.data}');
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      debugPrint('error  $error');
      return null;
    }
  }
}
