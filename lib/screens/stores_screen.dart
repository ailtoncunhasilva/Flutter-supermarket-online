import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/common/custom_drawer/custom_drawer.dart';
import 'package:supermercado_ac/compoments/store_list_tile.dart';
import 'package:supermercado_ac/models/store_manager.dart';

class StoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Seja bem vindo(a)!!'),
        centerTitle: true,
      ),
      body: Consumer<StoreManager>(
        builder: (_, storeManager, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: storeManager.allStores.length,
            itemBuilder: (_, index){
              return StoreListTile(storeManager.allStores[index]);
            },
          );
        },
      ),
    );
  }
}
