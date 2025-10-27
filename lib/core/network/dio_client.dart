import 'package:dio/dio.dart';

class DioClient {
  DioClient._();
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://17da260cded8.ngrok-free.app', // 👈 ajusta según tu backend
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Dio get instance => _dio;
}
