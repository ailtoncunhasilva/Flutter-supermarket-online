import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/models/page_manager.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  DrawerTile({this.iconData, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final int currentPage = context.watch<PageManager>().page;
    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Icon(
              iconData,
              size: 32,
              color: currentPage == page ? primaryColor : Colors.grey[700],
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: currentPage == page ? primaryColor : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
