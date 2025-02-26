import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF7043), Color(0xFFFFAB40)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 150,
          leading: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Menú',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          title: const Text(""),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 28),
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name !=
                    '/extras/escaner') {
                  Navigator.pushNamed(context, '/extras/escaner');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 🔹 Drawer mejorado con navegación optimizada
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF7043), Color(0xFFFFAB40)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              "Usuario Invitado",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text("usuario@email.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/usuario.png"),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _drawerItem(context, Icons.home, "Inicio", '/'),
                _drawerItem(
                  context,
                  Icons.shopping_cart,
                  "Pedidos",
                  '/pedidos',
                ),
                _drawerItem(context, Icons.favorite, "Favoritos", '/favoritos'),
                _drawerItem(
                  context,
                  Icons.settings,
                  "Configuración",
                  '/configuracion',
                ),
                _drawerItem(
                  context,
                  Icons.contact_mail,
                  "Contáctanos",
                  '/contacto',
                ),
                const Divider(),
                _drawerItem(
                  context,
                  Icons.login,
                  "Iniciar Sesión",
                  '/cliente/login_registro',
                  color: Colors.blue,
                ),
                _drawerItem(
                  context,
                  Icons.exit_to_app,
                  "Cerrar Sesión",
                  '/logout',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget para ítems del Drawer con navegación mejorada
  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String text,
    String route, {
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Cierra el drawer primero
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}
