import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Times extends StatefulWidget {
  const Times({Key? key}) : super(key: key);

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  List<bool> isSelected = [
    true,
    false,
  ];
  DateTime? _myDateTime;
  String time = 'Selecione uma Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Horários',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Color(0xFF0DA6DF),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            //decoration: BoxDecoration(
            //    color: Color(0xFFBCBFC1),
            //    borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                "Cabelo",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF666666)),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Column(
                    children: [
                      Text("R\$30,00",
                          style: TextStyle(
                              color: Color(0xFF0DA6DF),
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text("30min"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Divider(),
                  SizedBox(
                    child: Text("Selecione o Profissional:",
                        style: GoogleFonts.lexend(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0DA6DF)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Center(
                        child: ToggleButtons(
                          isSelected: isSelected,
                          selectedColor: Colors.white,
                          fillColor: Color(0xFF0DA6DF),
                          color: Color(0xFF0DA6DF),
                          borderWidth: 1,
                          borderColor: Color(0xFF0DA6DF),
                          selectedBorderColor: Color(0xFF0DA6DF),
                          borderRadius: BorderRadius.circular(5),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "Felipe",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "Alex",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelected.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelected[index] = true;
                                } else {
                                  isSelected[index] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0DA6DF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () async {
                              _myDateTime = await showDatePicker(
                                  context: context,
                                  initialDate: _myDateTime ?? DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2025));

                              setState(() {
                                time = DateFormat('dd/MM/yyyy')
                                    .format(_myDateTime!);
                              });
                            },
                            child: Text(
                              "Selecionar Data",
                              style: TextStyle(fontSize: 16),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            time,
                            style: GoogleFonts.lexend(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF666666)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "8:00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0DA6DF)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color(0xFF0DA6DF),
                                    ),
                                    minimumSize: Size(80, 35)),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "9:30",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0DA6DF)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color(0xFF0DA6DF),
                                    ),
                                    minimumSize: Size(80, 35)),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "11:00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0DA6DF)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color(0xFF0DA6DF),
                                    ),
                                    minimumSize: Size(80, 35)),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "8:30",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0DA6DF)),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xFF0DA6DF),
                                  ),
                                  minimumSize: Size(80, 35)),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "10:00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0DA6DF)),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xFF0DA6DF),
                                  ),
                                  minimumSize: Size(80, 35)),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "11:30",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0DA6DF)),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xFF0DA6DF),
                                  ),
                                  minimumSize: Size(80, 35)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "9:00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0DA6DF)),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xFF0DA6DF),
                                  ),
                                  minimumSize: Size(80, 35)),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "10:30",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0DA6DF)),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xFF0DA6DF),
                                  ),
                                  minimumSize: Size(80, 35)),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "13:00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0DA6DF)),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xFF0DA6DF),
                                  ),
                                  minimumSize: Size(80, 35)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Agendar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
