import 'package:flutter/material.dart';
import '../layouts/header.dart';

class ContactanosScreen extends StatelessWidget {
  const ContactanosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const CustomDrawer(), // Drawer reutilizado
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/comida.webp',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              color: Colors.black.withAlpha((0.6 * 255).toInt()),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Contáctanos",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _contactItem(Icons.phone, "Teléfono", "+51 987 654 321"),
                  _contactItem(
                    Icons.email,
                    "Correo",
                    "contacto@restaurante.com",
                  ),
                  _contactItem(
                    Icons.location_on,
                    "Dirección",
                    "Av. Principal 123, Iquitos",
                  ),
                  _contactItem(
                    Icons.schedule,
                    "Horario",
                    "Lun - Dom: 9 AM - 10 PM",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactItem(IconData icon, String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                info,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
