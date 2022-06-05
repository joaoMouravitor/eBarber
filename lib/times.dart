import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Times extends StatefulWidget {
  const Times({Key? key}) : super(key: key);

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
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
            height: 80,
            //decoration: BoxDecoration(
            //    color: Color(0xFFBCBFC1),
            //    borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                "Cabelo + Barba",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF666666)),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text("R\$50,00",
                        style: TextStyle(
                            color: Color(0xFF0DA6DF),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 20,
                    ),
                    Text("50min")
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (BuildContext context, int index) {
                  return Container();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
