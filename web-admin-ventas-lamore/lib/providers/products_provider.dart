

import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/wemlamoreApi.dart';
import 'package:admin_dashboard/models/http/Response.product.dart';

import 'package:admin_dashboard/models/product.dart';



class ProductsProvider extends ChangeNotifier{

  List<Product> products = [];

  getproducts() async {
     
    final response = await WebLAmoreApi.httpGet('/Proudctos');
    //final productsResponse = ResponseProduct.fromMap(response);
    
    this.products = [ response];
    

    notifyListeners();
  }

  /*Future newCategory( String name) async {
    
    final data = {
      'nombre': name
    };

    try{
       final json = await CafeApi.post('/categorias', data);
       final newCategory = Categoria.fromMap(json);
       categorias.add(newCategory);

       notifyListeners();
    }catch (e) {
       throw 'Error al crear la categoria.';
    }
  }

  Future updateCategory( String id, String name) async {
    
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