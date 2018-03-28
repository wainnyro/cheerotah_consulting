import 'package:cheerotah_consulting/Dashboard.dart';
import 'package:cheerotah_consulting/Home.dart';
import 'package:cheerotah_consulting/Submission.dart';
import 'package:cheerotah_consulting/SubmissionBoard.dart';
import 'package:cheerotah_consulting/Testinomials.dart';
import 'package:flutter/material.dart';

class CheerotahApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CheerotahAppState();
}

class _CheerotahAppState extends State<CheerotahApp> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 5, vsync: this);
  }


  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void donothing(){}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Cheerotah Consulting"),
//        centerTitle: true,
//        //backgroundColor: Colors.greenAccent[200],
//        backgroundColor: Colors.blueGrey[300],
//          actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.notifications), onPressed: donothing)
//        ],
//      ),

        drawer: new Drawer(),
        bottomNavigationBar: new Material(
            color: Colors.white70,
            child: new TabBar(
                controller: tabController,
                tabs: <Tab> [
                  new Tab(icon: new Icon(Icons.home, color: Colors.pink, size: 30.0,)),
                  new Tab(icon: new Icon(Icons.library_add, color: Colors.black, size: 30.0,)),
                  new Tab(icon: new Icon(Icons.dashboard, color: Colors.black, size: 30.0,)),
                  new Tab(icon: new Icon(Icons.mood, color: Colors.black, size: 30.0,))
                ]
            )
        ),
        body: new TabBarView(
            controller: tabController,
            children: <Widget> [
              new Home(),
              new Submission(),
              new Dashboard(),
              new Testinomials(),
            ]
        )
    );
  }

}

