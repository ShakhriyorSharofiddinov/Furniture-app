abstract class BaseService {
  final String baseUrl =  "https://5f210aa9daa42f001666535e.mockapi.io/api";

  Future<dynamic> getResponse(String url);
}
