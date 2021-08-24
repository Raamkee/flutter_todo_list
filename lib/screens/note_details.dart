import 'package:flutter/material.dart';
import '../Note.dart';
import '../database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _prioities = ["High", "Low"];
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Note note;

  NoteDetailState(this.note, this.appBarTitle);

  String taskPriority = '';

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
        return null;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white.withOpacity(0.2),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              moveToLastScreen();
            },
          ),
        ),
        body: Container(
          // height: 400,
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)]),
          child: ListView(
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
              //   child: new ListTile(
              //     leading: const Icon(Icons.low_priority),
              //     title: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.grey.withOpacity(0.05),
              //         borderRadius: BorderRadius.circular(10),
              //         // boxShadow: [
              //         //   BoxShadow(blurRadius: 3, color: Colors.grey)
              //         // ],
              //       ),
              //       child: DropdownButton(
              //           isExpanded: true,
              //           items: _prioities.map((String dropDownStringItem) {
              //             return DropdownMenuItem<String>(
              //               value: dropDownStringItem,
              //               child: Text(dropDownStringItem,
              //                   style: TextStyle(
              //                       fontSize: 20.0,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.blue)),
              //             );
              //           }).toList(),
              //           value: getPriorityAsString(note.priority),
              //           onChanged: (valueSelectedByUser) {
              //             setState(() {
              //               updatePriorityAsInt(valueSelectedByUser);
              //             });
              //           }),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 0.0, left: 20.0, right: 20.0),
                child: Text(
                  'Priority:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 5.0, left: 20.0, right: 20.0),
                child: _switchBar(),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 25.0, bottom: 0.0, left: 20.0, right: 20.0),
                child: Text(
                  'Title:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 5.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1), blurRadius: 5)
                    ],
                  ),
                  child: TextField(
                    controller: titleController,
                    style:
                        // textStyle,
                        TextStyle(fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      updateTitle();
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      border: InputBorder.none,
                      // labelText: 'Title',
                      // labelStyle: textStyle,
                      // icon: Icon(Icons.title),
                      hintText: 'Title',
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25.0, bottom: 0.0, left: 20.0, right: 20.0),
                child: Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 5.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1), blurRadius: 5)
                    ],
                  ),
                  child: TextField(
                    controller: descriptionController,
                    style:
                        // textStyle
                        TextStyle(fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      updateDescription();
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      border: InputBorder.none,
                      // labelText: 'Details',
                      // icon: Icon(Icons.details),
                      hintText: 'Description',
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25.0, bottom: 5.0, left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        // textColor: Colors.white,
                        // color: Colors.red,
                        // padding: const EdgeInsets.all(8.0),

                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    side: BorderSide(color: Colors.red))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            appBarTitle != "Add To-Do" ? 'Delete' : 'Cancel',
                            style: TextStyle(color: Colors.red),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            appBarTitle != "Add To-Do"
                                ? _delete()
                                : Navigator.of(context).pop();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 20.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        // textColor: Colors.white,
                        // color: Colors.green,
                        // padding: const EdgeInsets.all(8.0),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            'Save',
                            textScaleFactor: 1.2,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _save();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    moveToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
    } else {
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      _showAlertDialog("Status", "Note Saved Successfully");
    } else {
      _showAlertDialog("Status", "Problem In Saving Note");
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (note.id == null) {
      _showAlertDialog("Status", "First Add a Note");
      return;
    }
    int result = await helper.deleteNote(note.id);

    if (result != 0) {
      _showAlertDialog("Status", "Note Saved Successfully");
    } else {
      _showAlertDialog("Status", "Sorry, Error");
    }
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case "High":
        note.priority = 1;
        break;
      case "Low":
        note.priority = 2;
        break;
      default:
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _prioities[0];
        break;
      case 2:
        priority = _prioities[1];
        break;
      default:
    }
    return priority;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget _switchBar() {
    return InkWell(
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    topLeft: Radius.circular(7),
                  ),
                  color: getPriorityAsString(note.priority) == 'High'
                      ? Colors.blue
                      : Colors.white,
                  border: Border.all(color: Colors.blue)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'High',
                      textScaleFactor: 1.3,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                          color: getPriorityAsString(note.priority) == 'High'
                              ? Colors.white
                              : Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                color: getPriorityAsString(note.priority) == 'Low'
                    ? Colors.blue
                    : Colors.white,
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Low',
                      textScaleFactor: 1.3,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                          color: getPriorityAsString(note.priority) == 'Low'
                              ? Colors.white
                              : Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () {
        print('object');
        setState(() {
          print(getPriorityAsString(note.priority));
          getPriorityAsString(note.priority) == "High"
              ? updatePriorityAsInt("Low")
              : updatePriorityAsInt("High");
          print(getPriorityAsString(note.priority));
        });
      },
    );
  }
}
