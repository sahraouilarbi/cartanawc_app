// import 'dart:io';

// import 'package:dio/dio.dart';

// import 'package:cartanawc_app/data/api/api_endpoint.dart';
// import 'package:cartanawc_app/presentation/common/utils.dart';

// class HttpService {
//   Dio _dio = Dio();
//   HttpService() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: APIEndPoint().baseUrl,
//         //connectTimeout: 5000,
//         //receiveTimeout: 5000,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Basic ${APIConsumer().basicAuth}',
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       ),
//     );
//     initializeInterceptors();
//   }
//   Future<Response> getRequest(
//     String endPoint, {
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     Response response;
//     try {
//       response = await _dio.get(endPoint, queryParameters: queryParameters);
//     } on DioError catch (e) {
//       printDebugMessage(e.message);
//       throw Exception(e.message);
//     }
//     return response;
//   }

//   Future<Response> postRequest(String endPoint, dynamic data) async {
//     Response response;
//     try {
//       response = await _dio.post(
//         endPoint,
//         data: data,
//         options: Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
//           },
//         ),
//       );
//     } on DioError catch (e) {
//       printDebugMessage(e.message);
//       throw Exception(e.message);
//     }
//     return response;
//   }

//   void initializeInterceptors() {
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onError: (DioError error, handler) {
//           return handler.next(error);
//         },
//         onRequest: (request, handler) {
//           return handler.next(request);
//         },
//         onResponse: (response, handler) {
//           return handler.next(response);
//         },
//       ),
//     );
//   }
// }
