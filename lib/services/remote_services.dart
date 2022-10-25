import 'package:http/http.dart' as http;


class RemoteService{
  static getReq(String url) async {
    http.Response response = await http.get(Uri.parse(url),);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}












//https://6358344dc27556d28939aed4.mockapi.io/api/