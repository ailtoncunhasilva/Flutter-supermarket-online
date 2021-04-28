import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/common/custom_drawer/custom_drawer.dart';
import 'package:supermercado_ac/compoments/food_list_tile.dart';
import 'package:supermercado_ac/compoments/search_dialog.dart';
import 'package:supermercado_ac/models/food_manager.dart';
import 'package:supermercado_ac/widgets/floating_button.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<FoodManager>(
          builder: (_, foodManager, __) {
            if (foodManager.search.isEmpty) {
              return const Text('Alimentícios');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(foodManager.search));
                      if (search != null) foodManager.search = search;
                    },
                    child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        foodManager.search,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: [
          Consumer<FoodManager>(
            builder: (_, foodManager, __) {
              if (foodManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(foodManager.search));
                    if (search != null) foodManager.search = search;
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    foodManager.search = '';
                  },
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          /*Card(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child:*/ Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage('images/alimenticio.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          //),
          Expanded(
            child: Consumer<FoodManager>(
              builder: (_, foodManager, __) {
                final filteredFoodProducts = foodManager.filteredFoodProducts;
                return ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: filteredFoodProducts.length,
                  itemBuilder: (_, index) {
                    return FoodTile(filteredFoodProducts[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
