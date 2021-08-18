import 'package:flutter/material.dart';
import 'package:mydb_todo/screens/NavigationDrawer.dart';
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

  bool fabExt = false;
  final globalKey = new GlobalKey<ScaffoldState>();

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
          title: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Exit Alert!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Do You Really Want To Exit?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pop(context, false),
              // color: Colors.greenAccent,
            ),
            ElevatedButton(
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pop(context, true),
              // color: Colors.redAccent,
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: globalKey,
        drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.3),
          elevation: 0,
          title: Text(
            "Notes",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: InkWell(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: 35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 3.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5),
                            )),
                        child: Text('   '),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 23,
                        height: 3.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5),
                            )),
                        child: Text('   '),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 14,
                        height: 3.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5),
                            )),
                        child: Text('   '),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              globalKey.currentState.openDrawer();
            },
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.settings, color: Colors.black),
                onPressed: () {
                  print('settings');
                }),
            IconButton(
                icon: Icon(Icons.more_vert_rounded, color: Colors.black),
                onPressed: () {
                  print('more');
                })
          ],
        ),
        body: GestureDetector(
          child: ListView(physics: ClampingScrollPhysics(), children: [
            getNoteListView(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 8.0, top: 3),
              child: Container(
                child: ListTile(),
              ),
            )
          ]),
          onTap: () {
            setState(() {
              fabExt = false;
            });
            print('gesture..');
          },
        ),
        floatingActionButton:

            // FloatingActionButton.extended(
            //   label: Text('Add Note'),
            //   backgroundColor: Colors.blue,
            //   // child: Icon(Icons.add),
            //   icon: Icon(Icons.add),
            //   onPressed: () {
            //     navigateToDetail(Note("", "", 2), "Add Note");
            //   },
            // ),
            !fabExt
                ? FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        fabExt ? fabExt = false : fabExt = true;
                      });
                    },
                  )
                :
                // _fabSmallIcon(),
                _xtendedFabBg(),
        // _xtendedFabNoBg(),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, position) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            ),
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
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0),
              ),
              subtitle: Text(
                this.noteList[position].date,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 32,
                ),
                onTap: () {
                  navigateToDetail(this.noteList[position], "Edit Todo");
                },
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                ListTile(
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
                                ),
                                ListTile(
                                  title: Text(
                                    'Priority:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  subtitle: this.noteList[position].priority ==
                                          1
                                      ? Text(
                                          'High',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      : Text(
                                          'Low',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Description:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  subtitle: Text(
                                    this.noteList[position].description,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _xtendedFabNoBg() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      fabExt
          ? FloatingActionButton.extended(
              backgroundColor: Colors.transparent,
              elevation: 0,
              splashColor: Colors.blue,
              label: Text(
                'Note',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                Icons.notes,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  fabExt ? fabExt = false : fabExt = true;
                });
              },
              heroTag: 'Note',
              tooltip: 'Add Note',
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      fabExt
          ? FloatingActionButton.extended(
              backgroundColor: Colors.transparent,
              elevation: 0,
              splashColor: Colors.blue,
              label: Text(
                'To-Do',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                Icons.check_box_outlined,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  fabExt ? fabExt = false : fabExt = true;
                });
                navigateToDetail(Note("", "", 2), "Add To-Do");
              },
              heroTag: 'To-Do',
              isExtended: true,
              tooltip: 'Add To-Do',
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          setState(() {
            fabExt ? fabExt = false : fabExt = true;
          });
        },
        heroTag: null,
      ),
    ]);
  }

  Widget _xtendedFabBg() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      fabExt
          ? FloatingActionButton.extended(
              label: Text(
                'Note',
              ),
              icon: Icon(
                Icons.notes,
              ),
              onPressed: () {
                setState(() {
                  fabExt ? fabExt = false : fabExt = true;
                });
              },
              heroTag: 'Note',
              tooltip: 'Add Note',
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      fabExt
          ? FloatingActionButton.extended(
              label: Text(
                'To-Do',
              ),
              icon: Icon(
                Icons.check_box_outlined,
              ),
              onPressed: () {
                setState(() {
                  fabExt ? fabExt = false : fabExt = true;
                });
                navigateToDetail(Note("", "", 2), "Add To-Do");
              },
              heroTag: 'To-Do',
              isExtended: true,
              tooltip: 'Add To-Do',
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          setState(() {
            fabExt ? fabExt = false : fabExt = true;
          });
        },
        heroTag: null,
      ),
    ]);
  }

  Widget _fabSmallIcon() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      fabExt
          ? FloatingActionButton(
              child: Icon(Icons.notes),
              onPressed: () {
                setState(() {
                  fabExt ? fabExt = false : fabExt = true;
                });
              },
              heroTag: 'Note',
              isExtended: true,
              tooltip: 'Add Note',
              mini: true,
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      fabExt
          ? FloatingActionButton(
              child: Icon(Icons.check_box_outlined),
              onPressed: () {
                setState(() {
                  fabExt ? fabExt = false : fabExt = true;
                });
                navigateToDetail(Note("", "", 2), "Add To-Do");
              },
              heroTag: 'Event',
              isExtended: true,
              tooltip: 'Add Event',
              mini: true,
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          setState(() {
            fabExt ? fabExt = false : fabExt = true;
          });
        },
        heroTag: null,
      ),
    ]);
  }
}
