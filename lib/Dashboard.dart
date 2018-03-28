import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DashboardState();

}

class DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        bottom: new TabBar(
          controller: tabController,
          tabs: [
            new Tab(child: new Text("In progress (1)"),),
            new Tab(child: new Text("Completed (20)"))
          ]
        ),
        title: new Text("Dashboard"),
        centerTitle: true,
      ),
      
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new Text("In progress requests"),
          new Text("Completed requests")
        ],
      )
    );
  }

}