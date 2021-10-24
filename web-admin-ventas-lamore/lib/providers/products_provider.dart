

import 'dart:convert';

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
    final dataj = json.decode(data);
    try{
    
      final json = await WebLAmoreApi.post('/Productos', dataj);
      final newproduct = Product.fromMap(json);
      products.add(newproduct);

      notifyListeners();
    }catch (e) {
      print(e);
       throw 'Error al crear el producto.';
    }
  }
   
  Future updateProduct( int id, data) async {
    
    /*final data = {
      "nombreProducto": name,
      "cantidad": cantidad,
      "precio": precio
    };*/

    final dataj = json.decode(data);
    try{
     await WebLAmoreApi.put('/Productos/$id', dataj);

      this.products = this.products.map(
         (product) {
           if(product.idProducto != id) return product;

           product.nombreProducto = data.name;
           product.cantidad = data.cantidad;
           product.precio = data.precio;
           return product;
         }
       ).toList();

      notifyListeners();

    }catch (e) {
       throw 'Error al actulizar la producto';
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
