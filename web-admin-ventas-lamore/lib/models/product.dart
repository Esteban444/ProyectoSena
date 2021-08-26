
import 'dart:convert';

import 'dart:html';

class Product {
    Product({
        required this.idProducto,
        required this.nombreProducto,
        required this.cantidad,
        required this.precio,
    });

    int    idProducto;
    String nombreProducto;
    int    cantidad;
    int    precio;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        idProducto: json["idProducto"],
        nombreProducto: json["nombreProducto"],
        cantidad: json["cantidad"],
        precio: json["precio"],
    );

    Map<String, dynamic> toMap() => {
        "idProducto": idProducto,
        "nombreProducto": nombreProducto,
        "cantidad": cantidad,
        "precio": precio,
    };

}
