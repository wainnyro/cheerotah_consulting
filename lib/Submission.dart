import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Submission extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SubmissionState();

}

class SubmissionState extends State<Submission> {
  DatabaseReference database = FirebaseDatabase.instance.reference();
  final TextEditingController _textController = new TextEditingController();
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  Widget _newSubmissionControllerBar() {
    return new Container(
      child: new Card(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
//            new Container(
//              margin: const EdgeInsets.all(10.0),
//              padding: const EdgeInsets.all(10.0),
//              child: new Text(
//                  "New Request",
//                  style: const TextStyle(
//                    fontWeight: FontWeight.w700,
//                    fontSize: 30.0
//                  ),
//              ),
//
//            ),
            new Icon(Icons.attach_file),
            new Icon(Icons.send)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.signInSilently();
    FirebaseAuth.instance.signInAnonymously();
  }

  void _handleSubmitRequest(String text) {
    database.push().set({'testUser': text});
    print("Pushed to DB: $text");
    //sendPressed();
  }

  Widget enterQuestionField() {
    return new Container(
      height: 400.0,
      width: 400.0,
      color: Colors.white,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 400.0,
          maxHeight: 600.0
        ),
        child: new SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //reverse: true,
          child: new TextField(
            onSubmitted: _handleSubmitRequest,
            keyboardType: TextInputType.multiline,
            controller: _textController,
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your question here...",
              hintStyle: new TextStyle(
                color: Colors.grey
              )
            ),
            maxLines: null,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.blueGrey[100],
      appBar: new AppBar(
        title: new Text("New Request"),
        centerTitle: true,
//        actions: <Widget>[
//          new Container(
//            child: new Icon(Icons.attach_file),
//            padding: const EdgeInsets.only(right: 30.0) ,
//          ),
//          new Container(
//            child: new Icon(Icons.send),
//            padding: const EdgeInsets.only(right: 10.0),
//          )
//        ],
        //backgroundColor: Colors.grey[800],
        //backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
            child: new RaisedButton(
              onPressed: () => _handleSubmitRequest(_textController.text),
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.attach_file),
                  new Text(" Attact Files "),

                ],
              ),
              //color: Colors.blue,
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: new RaisedButton(
              onPressed: () => _handleSubmitRequest(_textController.text),
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.send),
                  new Text(" Send Request"),

                ],
              ),
            ),
          ),

        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
//            height: 50.0,
//            width: 400.0,
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              "Please enter your question (and healing request - if any) below. Please also include names and dates of birth of all people involved.",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),

            ),

          ),
          enterQuestionField(),
//
        ],
      )
    );
  }

  void sendPressed(){
    AlertDialog alert = new AlertDialog(
      content: new Text(
        "Your request has been submitted! Your approximate waiting time is 3 days. We will send you notification when your answer is ready. We thank you for your patience."
      ),
      actions: <Widget>[
        new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Got it!')),
        new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Donate to Cheerotah'))
      ],
    );
    showDialog(context: context, child: alert);
  }

}