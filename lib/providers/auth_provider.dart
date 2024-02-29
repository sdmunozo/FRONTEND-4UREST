

import 'package:dasha/api/api_4uRest.dart';
import 'package:dasha/models/http/auth_response.dart';
import 'package:dasha/router/router.dart';
import 'package:dasha/services/local_storage.dart';
import 'package:dasha/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;


  AuthProvider() {
    this.isAuthenticated();
  }


  login( String email, String password ) {

    // TODO: Petición HTTP
    this._token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    LocalStorage.prefs.setString('token', this._token! );
    
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: ir al backend y comprobar si el JWT es válido
    
    await Future.delayed(Duration(milliseconds: 1000 ));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }


register(String brandName, String branchName, String userFirstName, String userLastName, String userEmail, String userPassword) {
  
  final data = {
    'brandName': brandName,
    'branchName': branchName,
    'userFirstName': userFirstName,
    'userLastName': userLastName,
    'userEmail': userEmail,
    'userPassword': userPassword,
  };

  Api4uRest.post('/users/register', data).then((json) {
    print(json);
    // Parsea la respuesta JSON al modelo AuthResponse
    final authResponse = AuthResponse.fromJson(json);
    // Aquí puedes establecer el usuario y el token en tu estado global o almacenamiento local
    // Por ejemplo:
    // this.user = authResponse.user;
    // Guarda el token en el almacenamiento local
    LocalStorage.prefs.setString('token', authResponse.token);
    // Actualiza el estado de autenticación a autenticado
    // authStatus = AuthStatus.authenticated;
    // Navega al dashboard o la vista principal de la aplicación
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    // Configura nuevamente el Dio o tu cliente HTTP si es necesario
    // CafeApi.configureDio();
    // Notifica a los listeners para actualizar la UI si es necesario
    notifyListeners();

  }).catchError((e) {
    print('error en: $e');
    // Muestra una notificación de error si el registro falla
    //NotificationsService.showSnackbarError('Error en el registro: Usuario / Password no válidos');
  });
}


/*
register(String brandName, String branchName, String userFirstName, String userLastName, String userEmail, String userPassword, ) {
  
  final data = {
    'brandName': brandName,
    'branchName': branchName,
    'userFirstName': userFirstName,
    'userLastName': userLastName,
    'userEmail': userEmail,
    'userPassword': userPassword,
  };

  Api4uRest.post('/users/register', data).then(
    (json) {
      print(json);

      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      Api4uRest.configureDio();
      notifyListeners();
      
    }
  ).catchError((e) {
    print('error en: $e');
    //NotificationsService.showSnackbarError('Usuario / Password no válidos');
  });
} */



}
