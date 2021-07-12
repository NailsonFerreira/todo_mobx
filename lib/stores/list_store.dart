import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';
import 'package:flutter/services.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store{

  @observable
  String newTitle = "";

  @observable
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTitle(String v)=> newTitle=v;

  @action
  void addItem(){
    todoList.add(TodoStore(newTitle));
    _toastNative(newTitle);
    newTitle = "";
  }

  @computed
  bool get isFormValid => newTitle.isNotEmpty;


  Future<void> _toastNative(String message)async{
    try {
    final channel = MethodChannel("todo.mobx/channel");
      final messag = await channel.invokeMethod("toastNative", {"message":message});
      print("NATIVO $messag");
    } on PlatformException catch (e) {
      print("NATIVO ${e.message}");
    }
  }
}