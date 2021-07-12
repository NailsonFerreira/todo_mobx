import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todomobx/stores/list_store.dart';
import 'package:todomobx/stores/todo_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListStore _store = ListStore();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Observer(
          builder: (_) {
            return Container(
              margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Tarefas',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 32),
                        ),
                        IconButton(
                          icon: Icon(Icons.exit_to_app),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 16,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            CustomTextField(
                              controller: _controller,
                              hint: 'Tarefa',
                              onChanged: _store.setNewTitle,
                              suffix: _store.isFormValid
                                  ? CustomIconButton(
                                      radius: 32,
                                      iconData: Icons.add,
                                      onTap: () {
                                        _store.addItem();
                                        _controller.clear();
                                      },
                                    )
                                  : null,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: _store.todoList.length,
                                itemBuilder: (_, index) {
                                  final todo = _store.todoList[index];
                                  return Observer(builder: (_) {
                                    return ListTile(
                                      title: Text(
                                        todo.title,
                                        style: TextStyle(
                                          decoration: todo.done
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          color: todo.done
                                              ? Colors.green
                                              : Colors.black,
                                        ),
                                      ),
                                      onTap: todo.toggleDone,
                                    );
                                  });
                                },
                                separatorBuilder: (_, __) {
                                  return Divider();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
