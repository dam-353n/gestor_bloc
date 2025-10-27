import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';

class AuthRepository {
  final Dio _dio;
  
  AuthRepository({Dio? dio}) : _dio = dio ?? DioClient.instance;

  /// Simula LOGIN (puedes cambiar a /register o usar /login de tu backend)
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
     try {
      final res = await _dio.post('/login', data: {
        'email': email,
        'password': password,
      });

      // Si el backend respondió 200, todo bien:
      return {
        'ok': true,
        'statusCode': res.statusCode,
        'data': res.data,
      };
    } on DioException catch (e) {
      // Aquí entramos cuando Dio recibe 4xx/5xx (por ejemplo 401)
      final status = e.response?.statusCode;

      // Intentamos leer el mensaje que manda el backend
      String serverMessage = '';
      if (e.response?.data is Map &&
          e.response?.data['message'] != null) {
        serverMessage = e.response!.data['message'].toString();
      }

      // Devolvemos un resultado controlado (NO lanzamos throw)
      return {
        'ok': false,
        'statusCode': status,
        'message': serverMessage.isNotEmpty
            ? serverMessage
            : 'Credenciales inválidas',
      };
    } catch (e) {
      // Cualquier otro error raro (network caída, etc.)
      return {
        'ok': false,
        'statusCode': null,
        'message': 'Error inesperado: $e',
      };
    }
  }
}
