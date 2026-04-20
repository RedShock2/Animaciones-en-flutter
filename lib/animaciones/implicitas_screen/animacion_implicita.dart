// Autor: Luis Antonio
// Animación Implícita: usa AnimatedContainer para interpolar cambios de tamaño y color automáticamente

import 'package:flutter/material.dart';

// Widget con estado que muestra una animación implícita al tocar el contenedor
class EjemploAnimacionImplicita extends StatefulWidget {
  const EjemploAnimacionImplicita({super.key});

  @override
  State<EjemploAnimacionImplicita> createState() => _EjemploAnimacionImplicitaState();
}

class _EjemploAnimacionImplicitaState extends State<EjemploAnimacionImplicita> {
  // Controla si el contenedor está expandido o contraído
  bool _estaExpandido = false;

  // Alterna el estado de expansión para disparar la animación
  void _alternarTamano() {
    setState(() {
      _estaExpandido = !_estaExpandido;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animación Implícita')),
      body: Center(
        child: GestureDetector(
          onTap: _alternarTamano,
          // AnimatedContainer interpola automáticamente entre los valores anteriores y nuevos
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: _estaExpandido ? 200 : 100,
            height: _estaExpandido ? 200 : 100,
            color: _estaExpandido ? Colors.blue : Colors.red,
            child: const Center(
              child: Text(
                'Toca aquí',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}