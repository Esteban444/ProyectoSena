
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/wemlamoreApi.dart';
import 'package:admin_dashboard/models/http/ResponseProducts.dart';

import 'package:admin_dashboard/models/product.dart';

class ProductsProvider extends ChangeNotifier{

  List<Product> products = [];

  getproducts() async {
     
    final List listadoProductos = await WebLAmoreApi.httpGet('/Productos');
  
    listadoProductos.forEach((product) {


     //final productsFromJson = ResponseProducts.fromMap(product);
     final productsFromJson = Product.fromMap(product);
     products.add(productsFromJson);
     });
    
    
    products = products;
    
    notifyListeners();
  }

  Future newProduct( String name, int cantidad, int precio) async {
    
    final data = {
      'nombre': name,
      'cantidad': cantidad,
      'precio': precio
    };

    try{
       final json = await WebLAmoreApi.post('/Productos', data);
       final newproduct = Product.fromMap(json);
       products.add(newproduct);

       notifyListeners();
    }catch (e) {
       throw 'Error al crear el producto.';
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