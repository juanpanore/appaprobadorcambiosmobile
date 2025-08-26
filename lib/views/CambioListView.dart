import 'package:flutter/material.dart';
import '../controllers/CambioController.dart';
import '../models/Cambio.dart';

class CambioListView extends StatefulWidget {
  const CambioListView({super.key});

  @override
  State<CambioListView> createState() => _CambioListViewState();
}

class _CambioListViewState extends State<CambioListView> {
  final CambioController _controller = CambioController();

  @override
  Widget build(BuildContext context) {
    List<Cambio> cambios = _controller.obtenerCambios();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Cambios"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cambios.length,
        itemBuilder: (context, index) {
          final cambio = cambios[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(cambio.descripcion),
              subtitle: Text(
                "Creado: ${cambio.fechaCreacion} \nEstado: ${cambio.estado}",
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      setState(() {
                        _controller.aprobarCambio(cambio.id);
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _controller.rechazarCambio(cambio.id);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
