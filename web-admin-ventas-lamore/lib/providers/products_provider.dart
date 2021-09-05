
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/wemlamoreApi.dart';

import 'package:admin_dashboard/models/product.dart';

class ProductsProvider extends ChangeNotifier{

  List<Product> products = [];

  getproducts() async {
     
    final List listadoProductos = await WebLAmoreApi.httpGet('/Productos');
  
    listadoProductos.forEach((product) {
     final productsFromJson = Product.fromMap(product);
     products.add(productsFromJson);
    });
    
    products = products;
    
    notifyListeners();
  }

  /*Future newProduct( String name, int cantidad, int precio) async {
    
    dynamic data = {
      'nombre': name,
      'cantidad': cantidad,
      'precio': precio
    };

    try{
       final json = await WebLAmoreApi.post('/Productos', data);
       final newproduct = Product.fromJson(json);
       products.add(newproduct);

       notifyListeners();
    }catch (e) {
       throw 'Error al crear el producto.';
    }
  }*/

  
}