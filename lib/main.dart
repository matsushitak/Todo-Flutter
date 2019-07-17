import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: TodoPage.routeName,
      routes: {
        TodoPage.routeName: (context) => TodoPage(),
        TodoDetailPage.routeName: (context) => TodoDetailPage()
      },
    );
  }
}

class TodoPage extends StatefulWidget {
  static const routeName = "/";
  final todos = List<Todo>.generate(
    20,
    (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
        ),
  );

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          var todo = widget.todos[index];
          return ListTile(
            title: Text(todo.title),
            onTap: () {
              Navigator.pushNamed(
                context,
                TodoDetailPage.routeName,
                arguments: todo,
              );
            },
          );
        },
      ),
    );
  }
}

class TodoDetailPage extends StatelessWidget {
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}
