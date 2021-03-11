import 'package:flutter/material.dart';
import 'package:supermercado_ac/helpers/validators.dart';
import 'package:supermercado_ac/models/user.dart';
import 'package:supermercado_ac/models/user_manager.dart';
import 'package:supermercado_ac/screens/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Faça Login'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            child: Text(
              'Criar Conta',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Card(
          shape: shape,
          margin: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: TextFormField(
                        controller: emailController,
                        enabled: !userManager.loading,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email) {
                          if (!emailValid(email)) {
                            return 'Email inválido!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: TextFormField(
                        controller: passController,
                        enabled: !userManager.loading,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                        ),
                        validator: (pass) {
                          if (pass.isEmpty || pass.length < 6) {
                            return 'Senha inválida!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Esqueci minha senha'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12, left: 12, bottom: 12),
                      child: SizedBox(
                        height: 45,
                        child: RaisedButton(
                          shape: shape,
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formKey.currentState.validate()) {
                                    userManager.signIn(
                                      user: User(
                                        email: emailController.text,
                                        password: passController.text,
                                      ),
                                      onFail: (e) {
                                        scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Falha ao entrar: $e'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  }
                                },
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white))
                              : Text('Entrar'),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
