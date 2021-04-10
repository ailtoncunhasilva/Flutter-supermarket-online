import 'package:flutter/material.dart';

class CardCustomized extends StatelessWidget {
  final String imageFirebase;
  final String titleFirebase;
  final String descriptionFirebase;
  final double priceFirebase;

  CardCustomized(this.imageFirebase, this.titleFirebase,
      this.descriptionFirebase, this.priceFirebase);

  final RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(26),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: shape,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey[100], Colors.grey[400]],
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(imageFirebase),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.purple[100], Colors.purple[400]],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: textStyle(
                          text: priceFirebase.toString(),
                          size: 16.0,
                          family: 'Anton',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
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
                  onPressed: () {},
                  child: Text(
                    'Comprar',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
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
