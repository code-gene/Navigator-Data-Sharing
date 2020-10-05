import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Details.dart';
import 'Notes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  List<Notes> notes;

  HomeScreenState() {
    notes = Notes.initializeNotes().getNotes;
  }

  handleDetails(int index) async {
    bool data = await Navigator.push(context, MaterialPageRoute(builder: (context) => Details(notes[index])));
    this.setState(() {
      notes[index].setReadState = data;
    });
  }

  iconDisplay(int index) {
    bool read = notes[index].getReadState;
    return Icon(
        (read? Icons.check_circle: Icons.remove_circle),
        color: read ? Colors.green: Colors.red
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Notes',
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notes[index].getTitle,
                    ),
                    iconDisplay(index),
                  ],
                ),
              ),
              onTap: () async{
                bool data = await Navigator.push(context, MaterialPageRoute(builder: (context) => Details(notes[index])));
                this.setState(() {
                  notes[index].setReadState = data;
                });
              },
            );
          },
        ),
      )
    );
  }
}