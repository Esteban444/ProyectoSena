import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/wemlamoreApi.dart';

import 'package:admin_dashboard/models/clients.dart';





class ClientsProvider extends ChangeNotifier{

  List<Clients> clientes= [];

  getproducts() async {
     
    //final response = await WebLAmoreApi.httpGet('/Productos');
    //final productsResponse = ResponseProducts.fromMap(response);
    
    //this.products = [ response];
    
    notifyListeners();
  }

  Future newClient( int documento, String nombre, String apellidos, String direccion , String telefono, String email) async {
    
    final data = {
      
        'documento': documento,
        'nombres': nombre,
        'apellidos': apellidos,
        'direccion': direccion,
        'telefono': telefono,
        'email': email
    };

    try{
       final json = await WebLAmoreApi.post('/Clientes', data);
       final newclient = Clients.fromMap(json);
       clientes.add(newclient);

       notifyListeners();
    }catch (e) {
       throw 'Error al crear el cliente.';
    }
  }

  /*Future updateCategory( String id, String name) async {
    
    final data = {
      'nombre': name
    };

    try{
     await CafeApi.put('/categorias/$id', data);

      this.categorias = this.categorias.map(
         (category) {
           if(category.id != id) return category;

           category.nombre = name;
           return category;
         }
       ).toList();

      notifyListeners();

    }catch (e) {
       throw 'Eror al actulizar la categoria';
    }
  }

  Future deleteCategory( String id) async {
    

    try{
     await CafeApi.delete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();

    }catch (e) {
       throw 'Error al eliminar la categoria.';
    }
  }*/
}