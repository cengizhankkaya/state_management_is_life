import 'package:flutter/material.dart';
import 'package:state_management_is_life/feature/travel/view/travel_view.dart';

enum _TravelPages { home, bookmark, notification, profile }

class TravelTabView extends StatefulWidget {
  const TravelTabView({super.key});

  @override
  State<TravelTabView> createState() => _TravelTabViewState();
}

class _TravelTabViewState extends State<TravelTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _TravelPages.values.length,
      child: const Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            tabs: [
              Tab(child: Icon(Icons.accessibility_outlined)),
              Tab(child: Icon(Icons.bookmark_outlined)),
              Tab(child: Icon(Icons.notifications_outlined)),
              Tab(child: Icon(Icons.person_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TravelView(),
            Center(child: Text('Bookmark')),
            Center(child: Text('Notification')),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}
