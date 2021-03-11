import 'package:flutter/material.dart';
import 'dart:async';
import '../database_helper.dart';
import '../Note.dart';
import 'note_details.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));
    if (result == true) {
      updateListView();
    } else if (result == null) {
      Text("No Notes to Show");
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initalizeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }
    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Do You Really Want To Exit?"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pop(context, false),
              color: Colors.greenAccent,
            ),
            FlatButton(
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pop(context, true),
              color: Colors.redAccent,
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
          centerTitle: true,
        ),
        body: getNoteListView(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {
            navigateToDetail(Note("", "", 2), "Add Note");
          },
        ),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, position) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.white,
          elevation: 4.0,
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 2, color: Colors.blue),
              ),
              child: Icon(
                Icons.list,
                size: 34,
                color: Colors.blue,
              ),
            ),
            title: Text(
              this.noteList[position].title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            subtitle: Text(
              this.noteList[position].date,
              style: TextStyle(color: Colors.black),
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.open_in_new,
                color: Colors.blue,
                size: 32,
              ),
              onTap: () {
                navigateToDetail(this.noteList[position], "Edit Todo");
              },
            ),
          ),
        );
      },
    );
  }
}
