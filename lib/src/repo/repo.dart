import 'package:dio/dio.dart';
import 'package:interview/src/models/userdetail_model.dart';

import '../models/userlist_model.dart';

class DioClient {
  static const baseUrl = "https://reqres.in/";
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );
  final Options options = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  );
  errorMessage(e) {
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      print('Error sending request!');
      print(e.message);
    }
  }

  ///GetUserList =============>>>>>>>>>>>>>
  ///@Authour : Karthikeyan
  ///@company : Upturn Technology
  ///@function: GetUserList dynamic Data Link =>
  ///
  Future<UserDataModel> getUserList({required int pageNumber}) async {
    var url = "${baseUrl}api/users?page=$pageNumber";
    _dio.options.headers["content-Type"] = "application/json";

    try {
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        var data = response.data;
        return UserDataModel.fromJson(data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      errorMessage(e);
      throw Exception(e.message);
    }
  }

  ///GetUserDetail =============>>>>>>>>>>>>>
  ///@Authour : Karthikeyan
  ///@company : Upturn Technology
  ///@function: GetUserDetail dynamic Data Link =>
  ///
  Future<UserDetailModel> getUserDetail({required int userId}) async {
    var url = "${baseUrl}api/users/$userId";
    _dio.options.headers["content-Type"] = "application/json";

    try {
      print("url");
      print(url);
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        print("response");

        var data = response.data;
        return UserDetailModel.fromJson(data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      errorMessage(e);
      throw Exception(e.message);
    }
  }
}
