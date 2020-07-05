import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
            Text('Chats', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        actions: [
          Container(
            child: const Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Icon(Icons.camera_alt, size: 20),
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
              child: const Icon(Icons.edit, size: 20),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Container(
                  height: 50,
                  margin: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      fillColor: Colors.grey[800],
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60.0,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.add),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Your story',
                          style: TextStyle(fontSize: 12.0),
                        )
                      ],
                    );
                  }
                  return Container(
                    width: 80.0,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent, width: 3.0),
                      image: DecorationImage(
                        image: AssetImage('assets/cat-eyes-photo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/cat-eyes-photo.jpg'),
                ),
                title: Text(
                  'Catto Catty',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text("Feed me right now or else ... · 3:35 pm"),
                trailing: ClipOval(
                  child: Container(
                    width: 12,
                    height: 12,
                    color: Colors.blue[300],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
