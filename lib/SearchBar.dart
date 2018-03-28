import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SearchBarState();

}

class SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        margin: const EdgeInsets.only(top: 0.0, bottom: 0.0),

        //color: Colors.white,
        child: new Container(
          //color: Colors.blueGrey[50],
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: new TextField(
            decoration: new InputDecoration(
              hintText: "Search for a request...", icon: new Icon(Icons.search),
              //labelStyle: Colors.blueGrey[50],
            ),
          ),
        ),
      ),
    );
  }

}