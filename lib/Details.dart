import 'package:flutter/material.dart';
import 'package:notes/Notes.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {

  Notes selectNotes;
  Details(this.selectNotes);

  @override
  DetailsState createState() => DetailsState(selectNotes);
}

class DetailsState extends State<Details> {

  Notes selectNotes;
  DetailsState(this.selectNotes);

  checkBox(bool status) {
    this.setState(() {
      selectNotes.setReadState = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Details',
        ),
        leading: MaterialButton(
          onPressed: (){
            Navigator.pop(context, selectNotes.getReadState);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectNotes.getTitle,
            ),
            Checkbox(
              value: selectNotes.getReadState,
              onChanged: (newValue) {
                setState(() {
                  selectNotes.setReadState = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

