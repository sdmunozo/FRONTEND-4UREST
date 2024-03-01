import 'package:dasha/api/api_4uRest.dart';
import 'package:dasha/models/http/auth_response.dart';
import 'package:dasha/router/router.dart';
import 'package:dasha/services/local_storage.dart';
import 'package:dasha/services/navigation_service.dart';
import 'package:dasha/services/notification_services.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
  loading
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  User? user;

  AuthProvider() {
    this.isAuthenticated();
  }


  login( String email, String password ) async {

      final data = {
        'userEmail': email,
        'userPassword': password,
      };

      try {
        final json = await Api4uRest.post('/users/login', data);
        final authResponse = AuthResponse.fromJson(json);
        this.user = authResponse.user;

        if (authResponse.token != null && authResponse.token.isNotEmpty) {
          LocalStorage.prefs.setString('token', authResponse.token);
          authStatus = AuthStatus.authenticated;
        } else {
          authStatus = AuthStatus.notAuthenticated;
        }
        notifyListeners();
        if (authStatus == AuthStatus.authenticated) {
          NavigationService.replaceTo(Flurorouter.dashboardRoute);
          Api4uRest.configureDio();
        }
      } catch (e) {
        NotificationsService.showSnackbarError('Credenciales inválidas');
        authStatus = AuthStatus.notAuthenticated;
        notifyListeners();
      }
  }

Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await Api4uRest.httpGet('/auth');
      final authReponse = AuthResponse.fromJson(resp);
      LocalStorage.prefs.setString('token', authReponse.token );

      this.user = authReponse.user;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<void> register(String brandName, String branchName, String userFirstName, String userLastName, String userEmail, String userPassword) async {
  final data = {
    'brandName': brandName,
    'branchName': branchName,
    'userFirstName': userFirstName,
    'userLastName': userLastName,
    'userEmail': userEmail,
    'userPassword': userPassword,
  };

  try {
    final json = await Api4uRest.post('/users/register', data);
    final authResponse = AuthResponse.fromJson(json);
    this.user = authResponse.user;

    if (authResponse.token != null && authResponse.token.isNotEmpty) {
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
    } else {
      authStatus = AuthStatus.notAuthenticated;
    }
    notifyListeners();
    if (authStatus == AuthStatus.authenticated) {
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      Api4uRest.configureDio();
    }
  } catch (e) {
    NotificationsService.showSnackbarError('Email inválido');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
  
}