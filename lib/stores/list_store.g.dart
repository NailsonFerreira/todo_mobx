// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ListStore.isFormValid'))
          .value;

  final _$newTitleAtom = Atom(name: '_ListStore.newTitle');

  @override
  String get newTitle {
    _$newTitleAtom.reportRead();
    return super.newTitle;
  }

  @override
  set newTitle(String value) {
    _$newTitleAtom.reportWrite(value, super.newTitle, () {
      super.newTitle = value;
    });
  }

  final _$todoListAtom = Atom(name: '_ListStore.todoList');

  @override
  ObservableList<TodoStore> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoStore> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNewTitle(String v) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewTitle');
    try {
      return super.setNewTitle(v);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem() {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.addItem');
    try {
      return super.addItem();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTitle: ${newTitle},
todoList: ${todoList},
isFormValid: ${isFormValid}
    ''';
  }
}
