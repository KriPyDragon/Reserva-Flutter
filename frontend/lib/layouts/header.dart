import 'package:flutter/material.dart';
import '/cliente/login_registro.dart';

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
                        if (Scaffold.of(context).hasDrawer) {
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
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRegistroScreen(),
                  ),
                );
              },
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 🔹 Drawer mejorado con diseño moderno
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
              backgroundImage: AssetImage(
                "assets/usuario.png",
              ), // 🔹 Agrega un avatar
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _drawerItem(
                  icon: Icons.home,
                  text: "Inicio",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
                _drawerItem(
                  icon: Icons.restaurant_menu,
                  text: "Menú",
                  onTap: () {},
                ),
                _drawerItem(
                  icon: Icons.shopping_cart,
                  text: "Pedidos",
                  onTap: () {},
                ),
                _drawerItem(
                  icon: Icons.favorite,
                  text: "Favoritos",
                  onTap: () {},
                ),
                _drawerItem(
                  icon: Icons.settings,
                  text: "Configuración",
                  onTap: () {},
                ),
                const Divider(),
                _drawerItem(
                  icon: Icons.exit_to_app,
                  text: "Cerrar Sesión",
                  color: Colors.red,
                  onTap: () {
                    // Acción para cerrar sesión
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget para ítems del Drawer
  Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
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
      onTap: onTap,
    );
  }
}
