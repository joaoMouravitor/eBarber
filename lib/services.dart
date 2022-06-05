import 'package:ebarber/models/service.dart';
import 'package:ebarber/times.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  static final titleController = TextEditingController();
  static final priceController = TextEditingController();
  static final timeController = TextEditingController();
  final list = [];

  save() {
    Service service = Service(
        titleController.text, priceController.text, timeController.text);
    setState(() {
      list.add(service);
    });

    titleController.clear();
    priceController.clear();
    timeController.clear();

    Navigator.of(context).pop();
  }

  add() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar novo Serviço'),
            content: SizedBox(
              height: 200,
              width: 200,
              child: Column(children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Valor'),
                ),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(labelText: 'Tempo'),
                )
              ]),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  child: Text('Salvar'),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF0DA6DF)),
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
          'Agendar',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Color(0xFF0DA6DF),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Serviços",
                    style: GoogleFonts.lexend(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xFF0DA6DF)),
                    )),
                SizedBox(
                  width: 110,
                ),
                ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: Text("Novo Serviço"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1AD909),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: ListTile(
              title: Text(
                "Cabelo",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF666666)),
              ),
              subtitle: Row(
                children: [
                  Text("R\$ 30,00",
                      style: TextStyle(
                          color: Color(0xFF0DA6DF),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 20,
                  ),
                  Text("30min")
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Times()),
                  );
                },
                child: Text("Agendar"),
              ),
            ),
          ),
          Divider(),
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
                      title: Text(
                        list[index].title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF666666)),
                      ),
                      subtitle: Row(
                        children: [
                          Text("R\$ ${list[index].price},00",
                              style: TextStyle(
                                  color: Color(0xFF0DA6DF),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 20,
                          ),
                          Text("${list[index].time}min")
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Times()),
                          );
                        },
                        child: Text("Agendar"),
                      ),
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
    );
  }
}
