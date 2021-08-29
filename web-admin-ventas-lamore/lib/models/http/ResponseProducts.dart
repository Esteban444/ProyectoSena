
import 'dart:convert';

class ResponseProducts {
    ResponseProducts({
        required this.idProducto,
        required this.nombreProducto,
        required this.cantidad,
        required this.precio,
    });

    int idProducto;
    String nombreProducto;
    int cantidad;
    int precio;

    factory ResponseProducts.fromJson(String str) => ResponseProducts.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponseProducts.fromMap(Map<String, dynamic> json) => ResponseProducts(
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

