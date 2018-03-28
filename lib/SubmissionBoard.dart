import 'package:cheerotah_consulting/SearchBar.dart';
import 'package:flutter/material.dart';

class SubmissionBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SubmissionBoardState();

}

class SubmissionBoardState extends State<SubmissionBoard> {



  Widget _feedPost({String title, String content, bool image}) {
    return new Container(
        //margin: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        alignment: Alignment.topLeft,
        child: new Container(
            child: new Column(
              children: <Widget>[
                // Avatar - Name - Button
                new Container(
//                  decoration: new BoxDecoration(
//                    border: new Border(bottom: new BorderSide(color: Colors.grey)),
//                    color: Colors.grey
//                  ),
                  //padding: const EdgeInsets.all(15.0),
                  //color: Colors.grey[100],
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(),
                      new Expanded(
                        child: new Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Column(
                                children: <Widget>[
                                  new Text("Wainny Ta", style: const TextStyle(fontWeight: FontWeight.bold),),
                                  new Text("4 hours ago", style: const TextStyle(color: Colors.grey))
                                ]
                            )
                        ),
                      ),
                      new Container(
                        child: new Icon(Icons.favorite, color: Colors.red[500],),
                        padding: const EdgeInsets.only(right: 5.0),
                      )
                    ],
                  ),
                ),

                new Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: new Text(
                    "I need urgent help! I need urgent help!I need urgent help! I need urgent help!",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold
                    )
                  ),
                  color: Colors.amber[40],
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Text("This is my first post that I shared on my wall!!!! Hooray! This is my first post that I shared on my wall!!!! Hooray! This is my first post that I shared on my wall!!!! Hooray!")
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Image.asset('images/lovemeloveyou.jpg')
                )
              ],
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: new Column(
            children: <Widget>[
              new SearchBar(),
              //_filterBar(),
              new Expanded(
                child: new ListView(
                    children: <Widget> [
                      _feedPost(),
                      _feedPost()
                    ]
                ),
              ),
            ]
        )
    );
  }
}