

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

  Future newProduct( data) async {
    
    /*final data = {
      "nombreProducto": name,
      "cantidad": cantidad,
      "precio": precio
    };*/

    try{
    
      final json = await WebLAmoreApi.post('/Productos', data);
      final newproduct = Product.fromMap(json);
      products.add(newproduct);

      notifyListeners();
    }catch (e) {
       throw 'Error al crear el producto.';
    }
  }
   
  Future updateProduct( int id, String name, int cantidad, int precio) async {
    
    final data = {
      "nombreProducto": name,
      "cantidad": cantidad,
      "precio": precio
    };


    try{
     await WebLAmoreApi.put('/Productos/$id', data);

      this.products = this.products.map(
         (product) {
           if(product.idProducto != id) return product;

           product.nombreProducto = name;
           product.cantidad = cantidad;
           product.precio = precio;
           return product;
         }
       ).toList();

      notifyListeners();

    }catch (e) {
       throw 'Eror al actulizar la producto';
    }
  }
  
  Future deleteProduct( int id) async {
    

    try{
     await WebLAmoreApi.delete('/Productos/$id', {});

      products.removeWhere((product) => product.idProducto == id);

      notifyListeners();

    }catch (e) {
       throw 'Error al eliminar el producto.';
    }
  }
}
