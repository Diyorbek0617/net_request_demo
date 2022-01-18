
import 'dart:convert';

import 'package:http/http.dart';
import 'package:net_request_demo/model/post_model.dart';

class Network{
  static String BASE = 'dummy.restapiexample.com';
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  static String API_LIST = "/api/v1/employees";
  static String API_LIST_id = "/api/v1/employee/";//{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http('dummy.restapiexample.com', api,); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "so many request";
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http('dummy.restapiexample.com', api,); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return "so many request";
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http('dummy.restapiexample.com', api,); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return "so many request";
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http('dummy.restapiexample.com', api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "so many request";
  }


  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }
  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age.toString(),
    });
    return params;
  }

}