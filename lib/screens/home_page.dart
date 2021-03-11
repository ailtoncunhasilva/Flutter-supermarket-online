import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final TextStyle style = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    /*final TextStyle style = TextStyle(
      color: Colors.white,
      //fontWeight: FontWeight.bold,
      fontSize: 18,
    );*/
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/sacolalogotipo.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              /*ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Compre sem sair de casa,', style: style),
                            Text(
                              'e nós entregamos pra vc...',
                              style: style,
                            ),
                          ],
                        ),
                      ),
                      Image.asset('images/sacola.png'),
                    ],
                  ),
                ),
              ),*/
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 18),
                  child: ListView(
                    /*children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 45,
                          child: RaisedButton(
                            elevation: 16,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(18)),
                            ),
                            onPressed: () {},
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            child: Text(
                              'Moreno - PE',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 45,
                          child: RaisedButton(
                            elevation: 16,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(18)),
                            ),
                            onPressed: () {},
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            child: Text(
                              'Jaboatão Velho - PE',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                    ],*/
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  bool shoulReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
