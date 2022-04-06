import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // lable one
  const MyApp({Key? key}) : super(key: key);

  // program dalam langsung diunduh dan dijalankan pada laptop, tanpa adanya kesalahan error

  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

MaterialApp Main() {
  final List music = [
    "With You",
    "Next To Me",
    "Inception (feat. 1ho and chan",
    "Anoko Secret",
    "Last Dance",
    "Sunshine",
    "Dramatic Slow Motion",
    "Chocolatte Passion",
    "Pholaroid Love",
    "Like Flames"
  ];

  final List armusic = [
    "Mokita",
    "bear bear and friends, Gillchang",
    "airman,1ho, chan",
    "Eve",
    "Eve",
    "Anth, Conor Maynard",
    "TK from 凛として時雨",
    "凛として時雨",
    "ENHYPEN",
    "MindaRyn"
  ];

  final List almusic = [
    "AudioTrim",
    "Download",
    "Watshapp Audio",
    "Data",
    "Music"
  ];

  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      title: Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Text(" MP3 APP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )),
                      ),
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
                        unselectedLabelColor: Colors.orangeAccent,
                        indicatorColor: Colors.orangeAccent,
                        tabs: [
                          new Tab(icon: new Icon(Icons.audiotrack), text: "Tracks"),
                          new Tab(icon: new Icon(Icons.add_comment), text: "Playlist"),
                          new Tab(icon: new Icon(Icons.add_comment), text: "Album"),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Expanded(
                child: Container(
                  child: TabBarView(children: [
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(music[index], style: TextStyle(fontSize: 16)),
                              contentPadding: EdgeInsets.all(10),
                              subtitle: Text("Song by. " + armusic[index]),
                              leading: Container(
                                child: Image.network("https://cdn.pixabay.com/photo/2022/03/08/03/57/mp3-7054985__340.png"),
                              ),
                            ),
                          );
                        },
                        itemCount: music.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(music[index], style: TextStyle(fontSize: 14)),
                              contentPadding: EdgeInsets.all(20),
                              subtitle: Text('Song By' + armusic[index]),
                              leading: Container(
                                child: Image.network("https://cdn.pixabay.com/photo/2016/05/24/22/54/icon-1413583__340.png"),
                              ),
                            ),
                          );
                        },
                        itemCount: music.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text("Unknown ", style: TextStyle(fontSize: 14)),
                              contentPadding: EdgeInsets.all(20),
                              subtitle: Text(almusic[index]),
                              leading: Container(
                                child: Image.network("https://cdn.pixabay.com/photo/2016/05/24/22/54/icon-1413583__340.png"),
                              ),
                            ),
                          );
                        },
                        itemCount: almusic.length,
                      ),
                    ),
                  ]),
                ),
              ),
            )),
      ));
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
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

