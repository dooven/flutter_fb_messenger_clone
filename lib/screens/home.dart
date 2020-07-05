import 'package:flutter/material.dart';

import 'chat_list.dart';
import 'people_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [Chats(), PeopleList()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat_bubble),
            title: new Text('Chats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('People'),
          )
        ],
      ),
    );
  }
}
