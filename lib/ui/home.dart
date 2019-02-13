import 'package:flutter/material.dart';



class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}


class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white30,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.explore)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Home", style: TextStyle(fontSize: 40),)),
            Center(child: Text("Notify", style: TextStyle(fontSize: 40))),
            Center(child: Text("Map", style: TextStyle(fontSize: 40))),
            Center(child: Text("Profile", style: TextStyle(fontSize: 40))),
            Center(child: Text("Setup", style: TextStyle(fontSize: 40))),
          ],
        ),
      ),
    );
  }

}