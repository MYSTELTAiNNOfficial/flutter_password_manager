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

  static Future<List<GetDataByIdUser>> getDataByUserId() async {
    var key = await AuthService.getUid();
    var url = Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/data/get");
    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "api-key": key});
    
    List <GetDataByIdUser> data = [];
    var json = jsonDecode(response.body);
    data = (json['data'] as List).map((e) => GetDataByIdUser.fromJson(e)).toList();
    return data;
  }
}
