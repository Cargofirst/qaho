import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        toolbarHeight: 60,
        leading: const Align(
          alignment: Alignment.centerRight,
          child: QahoIcon(),
        ),
        actions: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            child: Icon(
              Icons.person,
              size: 34,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: const Badge(
              backgroundColor: Colors.green,
              child: Icon(Icons.notifications),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
              width: double.maxFinite,
            ),
            Text(
              'Commodity Trade Made Clear',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontFamily: 'Poppins-SemiBold',
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            const SearchBar(
              hintText: 'Search here',
              trailing: [
                Icon(
                  Icons.search,
                  size: 30,
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending Prompt',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.arrow_forward)
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  TrendingCard(
                    number: 1,
                    title: 'Export',
                  ),
                  TrendingCard(
                    number: 2,
                    title: 'Import',
                  ),
                  TrendingCard(
                    number: 2,
                    title: 'Domestic Trade',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SubTitle(
              text: 'Recently chat',
            ),
            Expanded(
              child: Card(
                color: Colors.grey.shade100,
                child: ListView(
                  children: const [
                    RecentChatBox(),
                    RecentChatBox(),
                    RecentChatBox(),
                    RecentChatBox(),
                    RecentChatBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QahoIcon extends StatelessWidget {
  const QahoIcon({
    super.key,
    this.size = 32,
    this.borderWidth = 2,
  });
  final double size;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(50),
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade800, width: borderWidth)),
      child: Image.asset(
        'assets/image/qaho.png',
        color: Colors.black,
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.all(8),
      child: NavigationBar(
        indicatorColor: Colors.black,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorShape: const CircleBorder(
          side: BorderSide(
              color: Colors.black,
              width: 16.0,
              strokeAlign: BorderSide.strokeAlignCenter),
        ),
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(
              Bootstrap.house_door_fill,
              size: 32,
            ),
            label: '',
            selectedIcon: Icon(
              Bootstrap.house_door_fill,
              size: 32,
              color: Colors.grey[200],
            ),
          ),
          NavigationDestination(
            icon: const Icon(
              Bootstrap.chat_dots_fill,
              size: 32,
            ),
            label: '',
            selectedIcon: Icon(
              Bootstrap.chat_dots_fill,
              size: 32,
              color: Colors.grey[200],
            ),
          ),
          NavigationDestination(
              icon: const Icon(
                Bootstrap.soundwave,
                size: 32,
              ),
              label: 'Home',
              selectedIcon: Icon(
                Bootstrap.soundwave,
                size: 32,
                color: Colors.grey[200],
              )),
        ],
      ),
    ));
  }
}

class NavSelectedIcon extends StatelessWidget {
  const NavSelectedIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        icon,
        size: 32,
      ),
    );
  }
}

class RecentChatBox extends StatelessWidget {
  const RecentChatBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Card(
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.chat_bubble_outline_outlined,
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Text(
                ' What are the problems faced by Exporters in India',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.number,
    required this.title,
  });
  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Text(number.toString()),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
