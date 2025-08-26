import '../models/Cambio.dart';

class CambioController {
  final List<Cambio> _cambios = [
    Cambio(id: 1, descripcion: "Actualizar logo de la app", fechaCreacion: DateTime.now().subtract(Duration(hours: 2))),
    Cambio(id: 2, descripcion: "Corregir error en login", fechaCreacion: DateTime.now().subtract(Duration(days: 1))),
    Cambio(id: 3, descripcion: "Agregar pantalla de perfil", fechaCreacion: DateTime.now()),
  ];

  List<Cambio> obtenerCambios() {
    _cambios.sort((a, b) => b.fechaCreacion.compareTo(a.fechaCreacion));
    return _cambios;
  }

  void aprobarCambio(int id) {
    final cambio = _cambios.firstWhere((c) => c.id == id);
    cambio.estado = "aprobado";
  }

  void rechazarCambio(int id) {
    final cambio = _cambios.firstWhere((c) => c.id == id);
    cambio.estado = "rechazado";
  }
}
