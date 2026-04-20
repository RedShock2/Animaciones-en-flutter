// Autor: Luis Antonio
// Animación Explícita: usa AnimationController y Tween para controlar manualmente la animación

import 'package:flutter/material.dart';

// Widget con estado que maneja una animación explícita de tamaño
class EjemploAnimacionExplicita extends StatefulWidget {
  const EjemploAnimacionExplicita({super.key});

  @override
  State<EjemploAnimacionExplicita> createState() => _EjemploAnimacionExplicitaState();
}

class _EjemploAnimacionExplicitaState extends State<EjemploAnimacionExplicita>
    with SingleTickerProviderStateMixin {
  // Controla el avance y retroceso de la animación
  late AnimationController _controlador;

  // Animación que interpola el tamaño entre 100 y 200 píxeles
  late Animation<double> _animacionTamano;

  // Rastrea si el contenedor está en estado expandido
  bool _estaExpandido = false;

  @override
  void initState() {
    super.initState();

    // Configura el controlador con duración de 1 segundo
    _controlador = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Define el rango de valores y la curva de aceleración
    _animacionTamano = Tween<double>(begin: 100, end: 200).animate(
      CurvedAnimation(parent: _controlador, curve: Curves.easeInOut),
    );

    // Fuerza el redibujado en cada frame de la animación
    _controlador.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // Libera el controlador al destruir el widget para evitar memory leaks
    _controlador.dispose();
    super.dispose();
  }

  // Avanza o retrocede la animación según el estado actual
  void _alternarAnimacion() {
    if (_estaExpandido) {
      _controlador.reverse();
    } else {
      _controlador.forward();
    }
    _estaExpandido = !_estaExpandido;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animación Explícita')),
      body: Center(
        child: GestureDetector(
          onTap: _alternarAnimacion,
          child: Container(
            width: _animacionTamano.value,
            height: _animacionTamano.value,
            color: Colors.purple,
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