import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  ScrollController scrollController = new ScrollController();
  List<String> entriesa = [
    "RIP, LOVE  ",
    "When Youre Gone ",
    "Like All My Friends",
    "Open Your Heart",
    "Even Horison",
    "You Were Loved",
    "Stuck",
    "Blow",
    "Take My Hand",
    "As It Was",
    "Bam Bam",
    "Light Switch",
    "As It Was",
    "Stay",
  ];
  List<String> entriesb = [
    "Strongest ",
    "Us in the Rain",
    "Im Gonna Love You ",
    "Matane Ga Areba",
    "Cake",
    "Morning Coffee",
    "Weak",
    "NandeMonaiya",
    "Polaroid Love",
    "Ghost",
    "Because I Love You",
    "Fiction",
    "Corssing Field",
    "Crying For Rain"
  ];

  List<String> entriesc = [
    "One of a Kind",
    "Gamushara",
    "With You",
    "Dust",
    "Next To Me",
    "Inception",
    "Anoko Secret",
    "Last Dance",
    "Sunshine",
    "Dramatic Slow Motion",
    "Chocolatte Passion",
    "Pholaroid Love",
    "Title",
    "Like Flames"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("AppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: NetworkImage("https://images.pexels.com/photos/3194469/pexels-photo-3194469.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "New Song"),
                      new Tab(icon: new Icon(Icons.auto_stories), text: "History"),
                      new Tab(icon: new Icon(Icons.add_comment), text: "My Playlist"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              new ListView.builder(
                itemCount: entriesa.length,
                controller: scrollController,
                itemExtent: 40.0,
                itemBuilder: (buildContext, index) {
                  return new Text(entriesa[index]);
                },
              ),
              new ListView.builder(
                itemCount: entriesb.length,
                itemExtent: 40.0,
                itemBuilder: (buildContext, index) {
                  return new Text(entriesb[index]);
                },
              ),
              new ListView.builder(
                itemCount: entriesc.length,
                itemExtent: 40.0,
                itemBuilder: (buildContext, index) {
                  return new Text(entriesc[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
