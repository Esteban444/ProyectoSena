
import 'package:dio/dio.dart';

class WebLAmoreApi {

  static Dio _dio = new Dio();
  
  static void configureDio() {

    _dio.options.baseUrl = 'http://localhost:5001/api';

  }

  static Future httpGet( String path ) async {

    try {
      
      final resp = await _dio.get(path);

      return resp.data;


    } catch (e) {
      throw('Error en el Get');
    }
  }

  static Future post( String path, Map<String, dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {
        
      final resp = await _dio.post(path, data: formData );
      return resp.data;

    } catch (e) {
      throw('Error en el Post');
    }
  }

  static Future put( String path, Map<String, dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {
        
      final resp = await _dio.put(path, data: formData );
      return resp.data;

    } catch (e) {
      throw('Error en el Put');
    }
  }
   
   static Future delete( String path, Map<String, dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {
        
      final resp = await _dio.delete(path, data: formData );
      return resp.data;

    } catch (e) {
      throw('Error en el Delete');
    }
  }
}