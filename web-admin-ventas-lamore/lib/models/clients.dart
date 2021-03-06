
import 'dart:convert';

class Clients {
    Clients({
        required this.idClientes,
        required this.documento,
        required this.nombres,
        required this.apellidos,
        required this.direccion,
        required this.telefono,
        required this.email,
    });

    int idClientes;
    int documento;
    String nombres;
    String apellidos;
    String direccion;
    String telefono;
    String email;

    factory Clients.fromJson(String str) => Clients.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Clients.fromMap(Map<String, dynamic> json) => Clients(
        idClientes: json["idClientes"],
        documento: json["documento"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "idClientes": idClientes,
        "documento": documento,
        "nombres": nombres,
        "apellidos": apellidos,
        "direccion": direccion,
        "telefono": telefono,
        "email": email,
    };
}
