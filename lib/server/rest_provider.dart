import 'package:dio/dio.dart';
import '../model/usuario.dart';

class RestServer{
  static RestServer helper = RestServer._createInstance();
  RestServer._createInstance();

  final Dio _dio = Dio();

  String prefixUrl = "https://gymapp-6e971-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";

    Future<int> insertUser(Usuario usuario) async{
      Response response = await _dio.post(
        prefixUrl + suffixUrl,
        data: usuario.toMap(),
      );
      return 42;
    }
}