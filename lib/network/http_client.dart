// import 'package:dio/dio.dart';

// class HttpClient {
//   late Dio dio;
//   final baseUrl =
//       'https://us-central1-mobile-internship-2022.cloudfunctions.net';

//   HttpClient() {
//     dio = Dio(BaseOptions(baseUrl: baseUrl));
//   }

//   Future<dynamic> post(String url, {dynamic body}) async {
//     final response = await dio.post(url, data: body);
//     return response.data;
//   }

//   Future<dynamic> get(String url) async {
//     final response = await dio.get(url);
//     return response.data;
//   }

//   Future<dynamic> put(String url, {dynamic body}) async {
//     final response = await dio.put(url, data: body);
//     return response.data;
//   }
// }
