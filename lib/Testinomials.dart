import 'package:flutter/material.dart';

class Testinomials extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TestinomialsState();

}

class TestinomialsState extends State<Testinomials> {

  TextEditingController _textController = new TextEditingController();
  void onpressed(){}

  Widget donateBar() {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//          new RaisedButton(
//            onPressed: onpressed,
//            child: new Text("Submit A Review"),
//            color: Colors.blue,
//            textColor: Colors.white,
//          ),
          new RaisedButton(
            onPressed: onpressed,
            child: new Text("Donate to Cheerotah"),
            color: Colors.green,
            textColor: Colors.white,

          ),
        ]
      ),
    );
  }

  Widget inputReview() {
    return new Container(
      height: 100.0,
      width: 400.0,
      color: Colors.white,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
            minHeight: 100.0,
            maxHeight: 100.0
        ),
        child: new SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //reverse: true,
          child: new TextField(
            keyboardType: TextInputType.multiline,
            controller: _textController,
            decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "Review Cheerotah...",
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

  Widget submitReview() {
    return new Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      color: Colors.grey[100],
      child: new Column(
        children: <Widget>[
          inputReview(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(right: 10.0, top: 2.0, bottom: 5.0),
                child: new RaisedButton(
                  onPressed: onpressed,
                  child: new Text("Submit Review"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget review() {
    return new Container(
      //padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 5.0, right: 5.0),
      color: Colors.grey[100],
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(left: 15.0, right: 20.0, top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("John Smith", style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                )),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star, color: Colors.amber,),
                    new Icon(Icons.star, color: Colors.amber,),
                    new Icon(Icons.star, color: Colors.amber,),
                    new Icon(Icons.star, color: Colors.amber,),
                    new Icon(Icons.star, color: Colors.amber,),
                  ],
                )
              ],
            ),
          ),

          new Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(top: 11.0, left: 10.0, right: 10.0, bottom: 11.0),
            child: new Container(
              child: new Text("Cheerotah is an awesome service. Thank you very much for your help. Cheerotah is an awesome service. Thank you very much for your help.")
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: new AppBar(
        title: new Text("Testinomials"),
        centerTitle: true,
      ),

      body: new Column(
        children: <Widget>[
          donateBar(),
          new Expanded(
            child: new ListView(
              children: <Widget>[
                submitReview(),
                review(),
                review(),
                review(),
                review(),
                review(),
                review()
              ],
            ),
          )
        ],
      )
    );
  }

}