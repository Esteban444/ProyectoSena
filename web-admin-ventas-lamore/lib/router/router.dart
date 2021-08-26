import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';

class Flurorouter {

  static final FluroRouter router = new FluroRouter();

  static String rootRoute     = '/';

  // Auth Router
  static String loginRoute    = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String clientesRoute = '/clientes';
  static String pedidosRoute = '/dashboard/pedidos';
  static String productosRoute = '/dashboard/productos';


  static void configureRoutes() {
    // Auth Routes
    router.define( rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define( loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define( registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none );

    // Dashboard
    router.define( clientesRoute, handler: DashboardHandlers.clientes, transitionType: TransitionType.fadeIn );
    router.define( pedidosRoute, handler: DashboardHandlers.pedidos, transitionType: TransitionType.fadeIn );
    router.define( productosRoute, handler: DashboardHandlers.productos, transitionType: TransitionType.fadeIn );

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

  }
  


}
