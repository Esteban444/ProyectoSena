import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/views/products_view.dart';
import 'package:admin_dashboard/ui/views/clients_view.dart';
import 'package:admin_dashboard/ui/views/orders_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';


class DashboardHandlers {

  static Handler clientes = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.clientesRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated )
        return DashboardView();
      else 
        return LoginView();
    }
  );


  static Handler pedidos = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.pedidosRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated )
        return OrdersView();
      else 
        return LoginView();
    }
  );


  static Handler productos = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.productosRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated )
        return ProductsView();
      else 
        return LoginView();
    }
  );


}

