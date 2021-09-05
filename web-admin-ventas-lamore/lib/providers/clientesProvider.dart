
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/wemlamoreApi.dart';

import 'package:admin_dashboard/models/clients.dart';





class ClientsProvider extends ChangeNotifier{

  List<Clients> clientes= [];

  getproducts() async {

    final List listadoClientes = await WebLAmoreApi.httpGet('/Clientes');
     
    listadoClientes.forEach((client) {

     final clientFromJson = Clients.fromMap(client);
     clientes.add(clientFromJson);
    });
    
    
    clientes = clientes;
    
    notifyListeners();
  }

 
}