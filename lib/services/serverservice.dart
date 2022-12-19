part of 'services.dart';

class ServerService {
  static Future<http.Response> login(String email, String uid) async {
    var url = Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/user/login");
    var body = jsonEncode({"email": email, "uid": uid});
    var response = await http.post(url, body: body, headers: {
      "Content-Type": "application/json",
      "api-key": ConstAPI.guestKey
    });
    return response;
  }

  static Future<http.Response> addData(String appName, String username,
      String email, String password, String desc) async {
    var key = await AuthService.getUid();
    var url = Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/data/add");
    var body = jsonEncode({
      "app_name": appName,
      "username": username,
      "email": email,
      "password": password,
      "desc": desc
    });
    var response = await http.post(url,
        body: body,
        headers: {"Content-Type": "application/json", "api-key": key});
    return response;
  }

  static Future<List<DataByIdUser>> getDataByUserId() async {
    var key = await AuthService.getUid();
    var url = Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/data/get");
    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "api-key": key});

    List<DataByIdUser> data = [];
    var json = jsonDecode(response.body);
    data = (json['data'] as List).map((e) => DataByIdUser.fromJson(e)).toList();
    return data;
  }

  static Future<List<DataByIdData>> getDataByDataId(dynamic id) async {
    var key = await AuthService.getUid();
    var url = Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/data/get");
    var body = jsonEncode({
      "id": id,
    });
    var response = await http.post(url,
        body: body,
        headers: {"Content-Type": "application/json", "api-key": key});

    List<DataByIdData> data = [];
    var json = jsonDecode(response.body);
    data = (json['data'] as List).map((e) => DataByIdData.fromJson(e)).toList();
    return data;
  }

  static Future<http.Response> editData(dynamic id, String app_name, String username,
      dynamic email, dynamic password, dynamic desc) async {
    var key = await AuthService.getUid();
    var response = await http.post(
        Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/data/update"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "api-key": key
        },
        body: jsonEncode(<String, String>{
          'id': id,
          'app_name': app_name,
          'username': username,
          'email': email,
          'password': password,
          'desc': desc
        }));

    var job = json.decode(response.body);
    return response;
  }

  static Future<http.Response> deleteData(dynamic id) async {
    var key = await AuthService.getUid();
    var response = await http.post(
        Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/data/delete"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "api-key": key
        },
        body: jsonEncode(<String, String>{
          'id': id,
        }));

    var job = json.decode(response.body);
    return response;
  }
}
