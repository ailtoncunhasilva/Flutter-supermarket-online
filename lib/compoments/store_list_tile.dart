import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/store.dart';

class StoreListTile extends StatelessWidget {
  StoreListTile(this.store);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(
                radius: 80,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    store.subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    store.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
