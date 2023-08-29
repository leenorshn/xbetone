import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: myAppBar(),
      body: Column(
        children: [
          const DefaultTabController(
            length: 8,
            initialIndex: 1,
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Tout",
                ),
                Tab(
                  text: "En direct",
                ),
                Tab(
                  text: "Avenir",
                ),
                Tab(
                  text: "En direct",
                ),
                Tab(
                  text: "Avenir",
                ),
                Tab(
                  text: "Preference",
                ),
                Tab(
                  text: "Autres",
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 25,
            itemExtent: 132,
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 24, bottom: 80),
            itemBuilder: (context, index) {
              return Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TeamTile(
                            abr: "RM",
                            image:
                                "https://cdn.icon-icons.com/icons2/1637/PNG/256/real-madrid_109486.png",
                            name: "Real Madrid"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text("15h:45"), Text("Mabakanga")],
                        ),
                        const TeamTile(
                          abr: "BC",
                          image:
                              "https://icons.iconarchive.com/icons/giannis-zographos/spanish-football-club/256/FC-Barcelona-icon.png",
                          name: "Barcelona",
                        ),
                      ],
                    ),
                  ));
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.refresh),
      ),
    );
  }

  PreferredSizeWidget myAppBar() {
    return AppBar(
      leading: const Icon(CupertinoIcons.app_badge),
      elevation: 1,
      title: const Text("XBet"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bell),
        ),
      ],
    );
  }
}

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.abr,
    required this.image,
    required this.name,
  });
  final String image;
  final String abr;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image,
          height: 64,
          width: 64,
        ),
        Text(
          abr,
          style: const TextStyle(fontSize: 24),
        ),
        Text(name)
      ],
    );
  }
}
