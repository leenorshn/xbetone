import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xbetone/apis/auth_api.dart';
import 'package:xbetone/apis/db.dart';
import 'package:xbetone/models/competition.dart';
import 'package:xbetone/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // with SingleTickerProviderStateMixin {
  // late TabController tabController;

  @override
  void initState() {
    //tabController = TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: myAppBar(),
      body: Column(
        children: [
          DefaultTabController(
            length: 5,
            initialIndex: 1,
            child: TabBar(
              isScrollable: true,
              onTap: (i) {
                setState(() {});
              },
              tabs: const [
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
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Competition>>(
                stream: Db().getData(),
                builder: (context, snapshot) {
                  print(snapshot.error);
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("Pas des matchs"),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      // itemExtent: 132,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 24,
                        bottom: 120,
                      ),
                      itemBuilder: (context, index) {
                        return MatchTile(
                          competition: snapshot.data![index],
                          onTap: () {},
                        );
                      },
                    );
                  }
                }),
          ),
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
      title: const Text(
        "XBet",
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search),
        ),
        IconButton(
          onPressed: () async {
            await AuthApi().deconnect().then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                  (route) => false);
            });
          },
          icon: const Icon(
            CupertinoIcons.person,
          ),
        ),
      ],
      // bottom: TabBar(
      //   controller: tabController,
      //   isScrollable: true,
      //   tabs: [
      //     Tab(
      //       text: "Tout",
      //     ),
      //     Tab(
      //       text: "En direct",
      //     ),
      //     Tab(
      //       text: "Avenir",
      //     ),
      //     Tab(
      //       text: "En direct",
      //     ),
      //     Tab(
      //       text: "Avenir",
      //     ),
      //     Tab(
      //       text: "Preference",
      //     ),
      //     Tab(
      //       text: "Autres",
      //     ),
      //   ],
      // ),
    );
  }
}

class MatchTile extends StatelessWidget {
  const MatchTile({
    super.key,
    required this.competition,
    this.onTap,
  });

  final Competition competition;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamTile(
                abr: "${competition.teamA?.abr}",
                image: "${competition.teamA?.image}",
                name: "${competition.teamA?.name}",
                point: "${competition.pointA}",
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${competition.date}"),
                  Text("${competition.pointX} \n X")
                ],
              ),
              TeamTile(
                abr: "${competition.teamB?.abr}",
                image: "${competition.teamB?.image}",
                name: "${competition.teamB?.name}",
                point: "${competition.pointB}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.abr,
    required this.image,
    required this.name,
    required this.point,
  });
  final String image;
  final String abr;
  final String name;
  final String point;

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
        Text(name),
        const SizedBox(
          height: 16,
        ),
        Text(point + " \n points"),
      ],
    );
  }
}
