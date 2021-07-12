import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todomobx/screens/list_screen.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore _loginStore = LoginStore();
  ReactionDisposer _disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposer = reaction((_) => _loginStore.loggedIn, (loggedIn) {
      if (loggedIn) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => ListScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.reaction.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(builder: (_) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: _loginStore.setEmail,
                        enabled: !_loginStore.loading,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !_loginStore.visiblePass,
                        onChanged: _loginStore.setSenha,
                        enabled: !_loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: _loginStore.visiblePass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: _loginStore.togglePassVisibility,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 44,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: _loginStore.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text('Login'),
                            color: Theme.of(context).primaryColor,
                            disabledColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: _loginStore.loginPressed,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
