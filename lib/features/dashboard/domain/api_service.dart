class ApiService {
  static ApiService? _instance;

  factory ApiService() {
    return _instance ??= ApiService._();
  }

  ApiService._();

  //List<String> getRandomImageByBreed(){}
}
