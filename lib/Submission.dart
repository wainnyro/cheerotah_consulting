import 'package:flutter/material.dart';

class Submission extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SubmissionState();

}

class SubmissionState extends State<Submission> {
  final TextEditingController _textController = new TextEditingController();
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

Widget scrollableQuestionField() {
  return new Container(
    color: Colors.grey,
    padding: new EdgeInsets.all(7.0),

    child: new ConstrainedBox(
      constraints: new BoxConstraints(
        minWidth: 200.0,
        maxWidth: 400.0,
        minHeight: 50.0,
        maxHeight: 50.0,
      ),

      child: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,

        // here's the actual text box
        child: new TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null, //grow automatically
          //focusNode: mrFocus,
          controller: _textController,
          //onSubmitted: currentIsComposing ? _handleSubmitted : null,
          decoration: new InputDecoration.collapsed(
              hintText: "Please enter a lot of text",
          ),
        ),
        // ends the actual text box

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
              onPressed: sendPressed,
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
              onPressed: sendPressed,
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