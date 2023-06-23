import 'package:justificaciones/src/models/usuario.dart';

class Grupo {
    int id;
    String nombre;
    String semestre;
    String carrera;
    String aula;
    DateTime createdAt;
    DateTime updatedAt;
    List<Usuario>? users;

    Grupo({
        required this.id,
        required this.nombre,
        required this.semestre,
        required this.carrera,
        required this.aula,
        required this.createdAt,
        required this.updatedAt,
        this.users,
    });

    factory Grupo.fromJson(Map<String, dynamic> json) => Grupo(
        id: json["id"],
        nombre: json["nombre"],
        semestre: json["semestre"],
        carrera: json["carrera"],
        aula: json["aula"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: json['users'] == null ? null : List<Usuario>.from(json['users'].map((x) => Usuario.fromJson(x)))
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "semestre": semestre,
        "carrera": carrera,
        "aula": aula,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users": users
    };
}
