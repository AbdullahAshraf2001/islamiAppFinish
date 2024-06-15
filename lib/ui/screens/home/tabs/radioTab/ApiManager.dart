import 'package:islami/ui/screens/home/tabs/radioTab/radioModel.dart';
import 'package:dio/dio.dart';


class ApiManager {
  final Dio dio;

  ApiManager()
      : dio = Dio(BaseOptions(
    baseUrl: "https://mp3quran.net",
  ));

  Future<RadioModel> getRadios() async{
    var response =
    await dio.get("/api/v3/radios", queryParameters: {"language":"ar"});
    return RadioModel.fromJson(response.data);
  }
}
