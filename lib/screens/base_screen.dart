import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/common/custom_drawer/custom_drawer.dart';
import 'package:supermercado_ac/models/page_manager.dart';
import 'package:supermercado_ac/screens/home_page.dart';
import 'package:supermercado_ac/screens/stores_screen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          StoresScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              elevation: 0,
              title: Text('Seja Bem Vindo(a)!!'),
              centerTitle: true,
            ),
            body: MyHomePage(),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Meus pedidos'),
              centerTitle: true,
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Produtos'),
              centerTitle: true,
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Lojas'),
              centerTitle: true,
            ),
          ),
          //Container(color: Colors.purpleAccent),
          //Container(color: Colors.purple),
        ],
      ),
    );
  }
}
