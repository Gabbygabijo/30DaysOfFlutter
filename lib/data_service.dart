import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToApi() async {
    // https://jsonplaceholder.typicode.com/posts/3
    final uri = Uri.http('jsonplaceholder.typicode.com', '/posts/3');
    final response = await http.get(uri);
    return response.body;
  }
}