import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_assignment/model/carmodel.dart';
import 'package:test_assignment/model/index.dart';

class api {
  final String _url = "https://dev-api.limadi.dk/api/v1";
  postData(data, apiurl) async {
    var fullurl = _url + apiurl;
    //print('data : $data');
    return http.post(Uri.parse(fullurl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiurl) async {
    var fullurl = _url + apiurl;
    http.Response response =
        await http.get(Uri.parse(fullurl), headers: _setHeaders());
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

   Future<Filter> fetchDriverInfo() async {
    String? _token = await SharedDataManageService().getToken();
    String authorization = "Bearer $_token";
    final response =
        await http.get(Uri.parse('https://dev-api.limadi.dk/api/v1/shift/app/index'), headers: {
      'content-type': 'application/json',
      'Authorization': authorization
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Filter.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Future<Cardetails> fetchCarInfo() async {
  //   String? _token = await SharedDataManageService().getToken();
  //   String authorization = "Bearer $_token";
  //   final response =
  //       await http.get(Uri.parse('https://dev-api.limadi.dk/api/v1/shift/app/index'), headers: {
  //     'content-type': 'application/json',
  //     'Authorization': authorization
  //   });

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Cardetails.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  // Future<UserProfile> uploadInfo(data) async {
  //   String? _token = await SharedDataManageService().getToken();
  //   String authorization = "Bearer $_token";
  //   final response = await http.post(
  //     Uri.parse('http://127.0.0.1:8000/api/user/update'),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': authorization
  //     },
  //     body: jsonEncode(data),
  //   );

  //   if (response.statusCode == 200) {

  //     return UserProfile.fromJson(jsonDecode(response.body));
  //   } else {

  //     throw Exception('Failed to process request.');
  //   }
  // }

  _setHeaders() => {'content-type': 'application/json', 'app-role': 'company'};
}

class SharedDataManageService {
//<======================================== Token Functionality
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
