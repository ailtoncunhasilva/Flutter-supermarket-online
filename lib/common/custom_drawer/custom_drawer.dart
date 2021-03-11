import 'package:flutter/material.dart';
import 'package:supermercado_ac/common/custom_drawer/custom_drawer_header.dart';
import 'package:supermercado_ac/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 221, 160, 221),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ), 
            ),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              DrawerTile(
                iconData: Icons.home,
                title: 'Início',
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.playlist_add_check,
                title: 'Meus pedidos',
                page: 1,
              ),
              DrawerTile(
                iconData: Icons.list,
                title: 'Produtos',
                page: 2,
              ),
              DrawerTile(
                iconData: Icons.location_on,
                title: 'Lojas',
                page: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
