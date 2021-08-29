import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';


class Sidebar extends StatelessWidget {
 

  void navigateTo( String routeName ) {
    NavigationService.navigateTo( routeName );
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [

          Logo(),

          SizedBox( height: 50 ),

          TextSeparator( text: 'main' ),

          MenuItem(
            text: 'Clientes',
            icon: Icons.people_alt_outlined,
            onPressed: () => navigateTo( Flurorouter.clientesRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.clientesRoute,
          ),

          MenuItem( 
            text: 'Pedidos', 
            icon: Icons.shopping_cart_outlined,
            onPressed: () => navigateTo( Flurorouter.pedidosRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.pedidosRoute,
          ),
        
          MenuItem( 
            text: 'Productos', 
            icon: Icons.dns_outlined,
            onPressed: () => navigateTo( Flurorouter.productosRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.productosRoute,
          ),

          SizedBox( height: 260 ),

          TextSeparator( text: 'Exit' ),

          MenuItem( text: 'Cerrar Sección', icon: Icons.exit_to_app_outlined,
           onPressed: (){
             Provider.of<AuthProvider>(context, listen: false)
                .logout();
           }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color( 0xff092044 ),
        Color( 0xff092042 ),
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}