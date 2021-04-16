import 'package:flutter/material.dart';

class CardCustomized extends StatelessWidget {
  final String imageFirebase;
  final String titleFirebase;
  final String descriptionFirebase;
  final double priceFirebase;

  CardCustomized(this.imageFirebase, this.titleFirebase,
      this.descriptionFirebase, this.priceFirebase);

  final RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: shape,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageFirebase),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textStyle(
                        text: titleFirebase,
                        size: 15.0,
                        weight: FontWeight.bold),
                    textStyle(
                        text: descriptionFirebase,
                        size: 13.0,
                        color: Colors.grey[600]),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6, 1, 6, 1),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.purple[50], Colors.purple[300]],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      //child: Padding(
                      //padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: textStyle(
                        text: priceFirebase.toString(),
                        size: 16.0,
                        family: 'Anton',
                      ),
                      //),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textStyle({text, color, size, family, weight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: family,
      fontWeight: weight,
    ),
  );
}

/*showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            scrollable: true,
                            content: Text('Produto adicionado ao carrinho'),
                          );
                        });*/

/*Card(
              elevation: 8,
              shape: shape,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: LinearGradient(
                    colors: [Colors.purple[200], Colors.purple[600]],
                  ),
                ),
                child: FlatButton(
                  colorBrightness: Brightness.light,
                  splashColor: Colors.purple[900],
                  padding: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  onPressed: (){},
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
            ),*/
