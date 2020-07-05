import 'package:flutter/material.dart';

class PeopleList extends StatefulWidget {
  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/cat-eyes-photo.jpg'),
            ),
            SizedBox(width: 8),
            Text('People', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        actions: [
          Container(
            child: const Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Icon(Icons.contacts, size: 20),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16),
          Container(
            child: const Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Icon(Icons.add, size: 20),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
