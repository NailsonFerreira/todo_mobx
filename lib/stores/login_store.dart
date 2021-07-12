import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      print(email);
      print(senha);
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool visiblePass = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setSenha(String value) {
    senha = value;
  }

  @action
  void togglePassVisibility() => visiblePass = !visiblePass;

  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    loading = false;
    loggedIn=true;
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPassValid => senha.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPassValid;

  @computed
  Function get loginPressed=>
      (isFormValid&&!loading)?login:null;
}
// flutter packages pub run build_runner watch
