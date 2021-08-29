import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/api/wemlamoreApi.dart';

import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/clientesProvider.dart';
import 'package:admin_dashboard/providers/products_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
 
void main() async {

  await LocalStorage.configurePrefs();
  WebLAmoreApi.configureDio();

  Flurorouter.configureRoutes();
  runApp(AppState());
}
 
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(lazy: false,create: ( _ ) => AuthProvider()),

        ChangeNotifierProvider(lazy: false,create: ( _ ) => SideMenuProvider()),

        ChangeNotifierProvider(lazy: false,create: ( _ ) => ProductsProvider()),

        ChangeNotifierProvider(lazy: false,create: ( _ ) => ClientsProvider()),

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
      title: 'Web LAmore',
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