import 'dart:convert';

import 'package:dasha/services/local_storage.dart';
import 'package:dio/dio.dart';

class Api4uRest {
  static Dio _dio = new Dio();

  static void configureDio() {
    final token = LocalStorage.prefs.getString('token');
    _dio.options.baseUrl = 'https://32af-131-178-102-140.ngrok-free.app';

    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
      'Authorization': 'Bearer $token',
      'ngrok-skip-browser-warning': 'true',
    };
  }

  static void setBranchToken(String branchId) {
    _dio.options.headers['Branch-ID'] = branchId;
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      if (resp.statusCode == 200) {
        return resp.data is String ? jsonDecode(resp.data) : resp.data;
      } else {
        print('Respuesta no exitosa: ${resp.statusCode}, ${resp.data}');
        throw ('Error en el GET: ${resp.statusCode}');
      }
    } catch (e) {
      print('Error en el GET: $e');
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    try {
      final resp = await _dio.post(
        path,
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return resp.data;
    } on DioException catch (e) {
      // Cambiado de DioError a DioException
      if (e.response != null) {
        // El servidor respondió con un código de error que no es 2xx
        //print('Datos de respuesta: ${e.response?.data}');
        //print('Encabezados de respuesta: ${e.response?.headers}');
        //print('Opciones de solicitud: ${e.response?.requestOptions}');
        // Puedes manejar diferentes códigos de estado aquí
        if (e.response?.statusCode == 400) {
          //print('Error 400: Solicitud incorrecta');
        }
        // Considera lanzar una excepción o manejar el error adecuadamente aquí
        throw ('Error en el POST: ${e.response?.statusCode}');
      } else {
        // Algo sucedió al preparar la solicitud que desencadenó un error
        //print('Error al enviar la solicitud: ${e.requestOptions}');
        //print('Mensaje de error: ${e.message}');
        // Considera lanzar una excepción o manejar el error adecuadamente aquí
        throw ('Error al enviar la solicitud: ${e.message}');
      }
    } catch (e) {
      // Manejo de cualquier otro error que no sea DioException
      //print('Error desconocido: $e');
      throw ('Error desconocido: $e');
    }
  }
}
