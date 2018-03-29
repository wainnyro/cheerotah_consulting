import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();

}

class HomeState extends State<Home> {

  void onPressed(){}

  Widget summaryItem(String count, String title, String subtitle, IconData icon) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                count,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
              new Icon(icon, color: Colors.pink,)
            ],
          ),
          new Text(title, style: const TextStyle(),),
          new Text(subtitle)
        ],
      )
    );
  }

  Widget summary() {
    return new Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          summaryItem("200 ", "Requests", "Submitted", Icons.question_answer),
          summaryItem("100 ", "Prayers", "Submitted", Icons.account_box),
          summaryItem("111 ", "Requests", "Answered", Icons.done),
          summaryItem("99", "Healings", "Sent", Icons.style)
        ],
      ),
    );
  }

  Widget callToAction() {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          summaryItem("10.1k", "Awesome", "Service", Icons.star),
          summaryItem("2k", "Predictions", "Came True", Icons.perm_camera_mic),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cheerotah Consulting"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          summary(),
          new Container(
            child: new Image.asset("images/lovemeloveyou.jpg")
          ),
          callToAction(),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new RaisedButton(
              onPressed: onPressed, child: new Text("Submit a Question or a Healing Request"),
              color: Colors.cyan,
              textColor: Colors.white,
            )
          ),
          
        ],
      )
    );
  }

}