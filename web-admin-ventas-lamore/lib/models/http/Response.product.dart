
import 'dart:convert';

class ResponseProduct {
    ResponseProduct({
        required this.idProducto,
        required this.nombreProducto,
        required this.cantidad,
        required this.precio,
    });

    int idProducto;
    String nombreProducto;
    int cantidad;
    int precio;

    factory ResponseProduct.fromJson(String str) => ResponseProduct.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponseProduct.fromMap(Map<String, dynamic> json) => ResponseProduct(
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
