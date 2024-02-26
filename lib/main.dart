import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dasha/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:dasha/ui/layouts/splash/splash_layout.dart';

import 'package:dasha/router/router.dart';

import 'package:dasha/providers/auth_provider.dart';
import 'package:dasha/providers/sidemenu_provider.dart';

import 'package:dasha/services/local_storage.dart';
import 'package:dasha/services/navigation_service.dart';

import 'package:dasha/ui/layouts/auth/auth_layout.dart';
 
void main() async {

  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(AppState());
}
 
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: ( _ ) => AuthProvider()
        ),

        ChangeNotifierProvider(
          lazy: false,
          create: ( _ ) => SideMenuProvider()
        )

      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dasha - 4uRest',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: ( _ , child ){
        
        final authProvider = Provider.of<AuthProvider>(context);

        if ( authProvider.authStatus == AuthStatus.checking )
          return SplashLayout();

        if( authProvider.authStatus == AuthStatus.authenticated ) {
          return DashboardLayout( child: child! );
        } else {
          return AuthLayout( child: child! );
        }
              

      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5)
          )
        )
      ),
    );
  }
}