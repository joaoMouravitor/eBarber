import 'package:ebarber/menu.dart';
import 'package:ebarber/models/task.dart';
import 'package:ebarber/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  static final titleController = TextEditingController();
  static final descriptionController = TextEditingController();

  final list = [];

  void remove(index) {
    setState(() {
      list.removeAt(index);
    });
  }

  save() {
    Task task = Task(titleController.text, descriptionController.text);
    setState(() {
      list.add(task);
    });

    titleController.clear();
    descriptionController.clear();

    Navigator.of(context).pop();
  }

  add() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar nova Tarefa'),
            content: SizedBox(
              height: 200,
              width: 200,
              child: Column(children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Descrição'),
                )
              ]),
            ),
            actions: [
              Center(
                child: RaisedButton(
                  onPressed: () {
                    save();
                  },
                  child: Text('Salvar'),
                  color: Color(0xFFFE6847),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Color(0xFF0DA6DF),
      ),
      drawer: Menu(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Meus Agendamentos",
                style: GoogleFonts.lexend(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFF0DA6DF)),
                )),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 80,
                    //decoration: BoxDecoration(
                    //    color: Color(0xFFBCBFC1),
                    //    borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: Text(list[index].title),
                      subtitle: Text(list[index].description),
                      trailing: IconButton(
                          onPressed: () {
                            remove(index);
                          },
                          icon: Icon(Icons.delete)),
                      iconColor: Color(0xFFFE6847),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemCount: list.length),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Services()),
          )
        },
        tooltip: 'Menu',
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xFF1AD909),
      ),
    );
  }
}
