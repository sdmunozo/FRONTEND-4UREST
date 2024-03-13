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
  loading,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  User? user;
  Bran? brand;
  Bran? branch;
  Bran? selectedBrand;
  Bran? selectedBranch;

  AuthProvider() {
    this.isAuthenticated();
  }

  Future<void> login(String email, String password) async {
    final data = {
      'userEmail': email,
      'userPassword': password,
    };

    try {
      final json = await Api4uRest.post('/users/login', data);
      final authResponse = AuthResponse.fromJson(json);
      this.user = authResponse.user;
      this.brand = authResponse.brand;
      this.branch = authResponse.branch;

      if (authResponse.token != null && authResponse.token.isNotEmpty) {
        LocalStorage.prefs.setString('token', authResponse.token);
        this._token = authResponse.token;
        authStatus = AuthStatus.authenticated;

        if (this.brand != null && this.branch != null) {
          selectedBrand = this.brand;
          selectedBranch = this.branch;
          Api4uRest.setBranchToken(selectedBranch?.id ?? '');
          notifyListeners();
        }
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

  Future<void> register(
      String brandName,
      String branchName,
      String userFirstName,
      String userLastName,
      String userEmail,
      String userPassword) async {
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
      this.brand = authResponse.brand;
      this.branch = authResponse.branch;

      if (authResponse.token != null && authResponse.token.isNotEmpty) {
        LocalStorage.prefs.setString('token', authResponse.token);
        this._token = authResponse.token;
        authStatus = AuthStatus.authenticated;

        if (this.brand != null && this.branch != null) {
          selectedBrand = this.brand;
          selectedBranch = this.branch;
          Api4uRest.setBranchToken(selectedBranch?.id ?? '');
          notifyListeners();
        }
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

  void logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    this.brand = null;
    this.branch = null;
    this.user = null;
    this._token = null;
    this.selectedBrand = null;
    this.selectedBranch = null;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    Api4uRest.configureDio();

    try {
      final response = await Api4uRest.post('/users/auth', {});
      if (response != null) {
        final authResponse = AuthResponse.fromJson(response);
        LocalStorage.prefs.setString('token', authResponse.token);
        this._token = authResponse.token;

        this.user = authResponse.user;
        this.brand = authResponse.brand;
        this.branch = authResponse.branch;

        if (this.brand != null && this.branch != null) {
          selectedBrand = this.brand;
          selectedBranch = this.branch;
          Api4uRest.setBranchToken(selectedBranch?.id ?? '');
          notifyListeners();
        }

        authStatus = AuthStatus.authenticated;
        notifyListeners();
        return true;
      } else {
        authStatus = AuthStatus.notAuthenticated;
        notifyListeners();
        return false;
      }
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<String?> getToken() async {
    return _token;
  }
}
