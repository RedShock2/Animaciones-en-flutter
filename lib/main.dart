// Autor: Luis Antonio
// Proyecto: Animaciones en Flutter — práctica de animaciones implícitas y explícitas

import 'package:flutter/material.dart';
import 'animaciones/implicitas_screen/animacion_implicita.dart';
import 'animaciones/explicitas_screen/animacion_explicita.dart';

void main() {
  runApp(const AnimacionesApp());
}

// Widget raíz de la aplicación
class AnimacionesApp extends StatelessWidget {
  const AnimacionesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo de Animaciones',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const PantallaInicio(),
    );
  }
}

// Pantalla principal con botones de navegación a cada tipo de animación
class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  // Navega a la pantalla indicada usando una ruta con MaterialPageRoute
  void _navegarA(BuildContext context, Widget pantalla) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => pantalla),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones en Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón para ver el ejemplo de animación implícita
            ElevatedButton(
              onPressed: () => _navegarA(context, const EjemploAnimacionImplicita()),
              child: const Text('Animación Implícita'),
            ),
            const SizedBox(height: 20),
            // Botón para ver el ejemplo de animación explícita
            ElevatedButton(
              onPressed: () => _navegarA(context, const EjemploAnimacionExplicita()),
              child: const Text('Animación Explícita'),
            ),
          ],
        ),
      ),
    );
  }
}