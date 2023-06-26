
import 'package:justificaciones/src/models/usuario.dart';

class Justificacion {
    int id;
    String identificador;
    DateTime fechaInicio;
    DateTime fechaFin;
    String motivo;
    String emailDocente;
    int alumnoId;
    DateTime? createdAt;
    DateTime? updatedAt;
    Usuario? alumno;

    Justificacion({
        required this.id,
        required this.identificador,
        required this.fechaInicio,
        required this.fechaFin,
        required this.motivo,
        required this.emailDocente,
        required this.alumnoId,
        this.createdAt,
        this.updatedAt,
        this.alumno
    });

    factory Justificacion.fromJson(Map<String, dynamic> json) => Justificacion(
        id: json["id"],
        identificador: json["identificador"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        motivo: json["motivo"],
        emailDocente: json['email_docente'],
        alumnoId: json["alumno_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        alumno: json['alumno'] == null ? null : Usuario.fromJson(json["alumno"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "identificador": identificador,
        "fecha_inicio": "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fecha_fin": "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "motivo": motivo,
        "alumno_id": alumnoId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "alumno": alumno?.toJson()
    };
}
