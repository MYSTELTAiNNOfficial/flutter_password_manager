part of 'services.dart';

class MasterDataService {
  static Future<http.Response> getAllDatas() async {
    var response = await http.get(
        Uri.http("BASE_URL", "/index.php/api/data/get"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    var job = json.decode(response.body);
    print(job.toString());

    return response;
  }

  static Future<http.Response> AddData(dynamic app_name, dynamic username,
      dynamic email, dynamic password, dynamic desc) async {
    var response =
        await http.post(Uri.http("BASE_URL", "/index.php/api/data/add"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'app_name': app_name,
              'username': username,
              'email': email,
              'password': password,
              'description': desc
            }));

    var job = json.decode(response.body);
    print(job.toString());

    return response;
  }
}
