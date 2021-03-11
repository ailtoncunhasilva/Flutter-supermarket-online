import 'package:flutter/material.dart';
import 'package:supermercado_ac/helpers/validators.dart';
import 'package:supermercado_ac/models/user.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/models/user_manager.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Cadraste-se'),
        centerTitle: true,
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
                        decoration: InputDecoration(
                          hintText: 'Nome e sobrenome',
                          labelText: 'Nome',
                        ),
                        enabled: !userManager.loading,
                        validator: (name) {
                          if (name.isEmpty)
                            return 'Campo obrigatório';
                          else if (name.trim().split(' ').length <= 1)
                            return 'Preencha seu nome corretamente';
                          return null;
                        },
                        onSaved: (name) => user.name = name,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          labelText: 'E-mail',
                        ),
                        enabled: !userManager.loading,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email.isEmpty)
                            return 'Campo obrigatório';
                          else if (!emailValid(email)) return 'E-mail inválido';
                          return null;
                        },
                        onSaved: (email) => user.email = email,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          labelText: 'Senha',
                        ),
                        enabled: !userManager.loading,
                        obscureText: true,
                        validator: (pass) {
                          if (pass.isEmpty)
                            return 'Campo obrigatório';
                          else if (pass.length <= 5)
                            return 'Senha deve conter 6 dígitos no mínimo';
                          return null;
                        },
                        onSaved: (pass) => user.password = pass,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Repita a senha',
                          labelText: 'Repetir senha',
                        ),
                        enabled: !userManager.loading,
                        obscureText: true,
                        validator: (pass2) {
                          if (pass2.isEmpty)
                            return 'Campo obrigatório';
                          else if (pass2.length <= 5)
                            return 'Senha deve conter 6 dígitos no mínimo';
                          return null;
                        },
                        onSaved: (pass) => user.confirmPassword = pass,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Fone(whatsApp)',
                          labelText: 'Fone',
                        ),
                        enabled: !userManager.loading,
                        keyboardType: TextInputType.phone,
                        validator: (phone) {
                          if (phone.isEmpty)
                            return 'Campo obrigatório';
                          else if (phone.length < 9) return 'Fone inválido';
                          return null;
                        },
                        onSaved: (phone) => user.phone = phone,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Endereço',
                          labelText: 'Endereço',
                        ),
                        enabled: !userManager.loading,
                        maxLines: null,
                        validator: (adress) {
                          if (adress.isEmpty)
                            return 'Campo obrigatório';
                          else if (adress.trim().split(' ').length <= 2)
                            return 'Endereço inválido';
                          return null;
                        },
                        onSaved: (adress) => user.adress = adress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
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
                                    formKey.currentState.save();

                                    if (user.password != user.confirmPassword) {
                                      scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Senhas não coincidem!',
                                            textAlign: TextAlign.center,
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }

                                    userManager.singUp(
                                      user: user,
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                      },
                                      onFail: (e) {
                                        scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Falha ao cadastrar: $e',
                                              textAlign: TextAlign.center,
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              )
                              : Text(
                                  'Criar Conta',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
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
