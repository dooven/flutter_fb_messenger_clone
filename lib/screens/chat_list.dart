import 'package:flutter/material.dart';
import 'package:flutter_fb_messenger_clone/widgets/widgets.dart';

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
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40.0,
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
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: StatusBadge(
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            'assets/cat-eyes-photo.jpg',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: StatusBadge(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/cat-eyes-photo.jpg'),
                    ),
                  ),
                  title: Text(
                    'Catto Catty',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text("Feed me right now or else ... · 3:35 pm"),
                  trailing: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
