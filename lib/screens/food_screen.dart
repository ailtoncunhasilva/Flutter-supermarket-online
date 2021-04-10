import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/common/custom_drawer/custom_drawer.dart';
import 'package:supermercado_ac/compoments/food_list_tile.dart';
import 'package:supermercado_ac/models/food_manager.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Alimentício'),
        centerTitle: true,
      ),
      body: Consumer<FoodManager>(
        builder: (_, foodManager, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: foodManager.foodList.length,
            itemBuilder: (_, index){
              return FoodTile(foodManager.foodList[index]);
            },
          );
        },
      ),
    );
  }
}
