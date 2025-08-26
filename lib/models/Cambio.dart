class Cambio {
  final int id;
  final String descripcion;
  final DateTime fechaCreacion;
  String estado; // pendiente, aprobado, rechazado

  Cambio({
    required this.id,
    required this.descripcion,
    required this.fechaCreacion,
    this.estado = "pendiente",
  });
}