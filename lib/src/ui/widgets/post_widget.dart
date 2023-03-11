import 'package:flutter/material.dart';
import 'package:lomj/src/ui/screens/post/post_description_screen.dart';

class PostFeedScreen extends StatefulWidget {
  @override
  _PostFeedScreenState createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  List<Map<String, dynamic>> _posts = [
    {
      'image': 'assets/mary.jpg',
      'description': 'I had so much fun at the beach yesterday! ☀️🌊',
      'user': 'John Doe',
      'avatar': 'assets/images/avatar.png',
      'time': '2h ago',
    },
    {
      'image': 'assets/mary1.jpg',
      'description': 'Just finished my morning workout! 💪🏋️‍♀️',
      'user': 'Jane Smith',
      'avatar': 'assets/images/avatar.png',
      'time': '3h ago',
    },
    {
      'image': 'assets/mary2.jpg',
      'description': 'I love exploring new places! 🌍✈️',
      'user': 'Bob Johnson',
      'avatar': 'assets/images/avatar.png',
      'time': '4h ago',
    },
    {
      'image': 'assets/mary3.jpg',
      'description': 'Check out this amazing sunset! 🌅😍',
      'user': 'Sarah Lee',
      'avatar': 'assets/images/avatar.png',
      'time': '5h ago',
    },
    {
      'image': 'assets/mary4.jpg',
      'description': 'Nothing beats a good cup of coffee in the morning! ☕️',
      'user': 'Alex Wang',
      'avatar': 'assets/images/avatar.png',
      'time': '6h ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage(_posts[index]['avatar']),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      _posts[index]['user'],
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      _posts[index]['time'],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => PostDescriptionScreen(post: _posts)));
                    },
                    child: Image.asset(_posts[index]['image'])),
                SizedBox(height: 16.0),
                Text(
                  _posts[index]['description'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
