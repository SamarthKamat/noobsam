import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _navigateToGallery(BuildContext context, String roomType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPage(roomType: roomType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Booking App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: PageView(
                children: <Widget>[
                  Image.asset('assets/image1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/image2.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Explore Our Rooms',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1,
                    children: <Widget>[
                      RoomCard(
                        roomType: 'Standard',
                        onTap: () => _navigateToGallery(context, 'Standard'),
                      ),
                      RoomCard(
                        roomType: 'Premium',
                        onTap: () => _navigateToGallery(context, 'Premium'),
                      ),
                      RoomCard(
                        roomType: 'Luxury',
                        onTap: () => _navigateToGallery(context, 'Luxury'),
                      ),
                      RoomCard(
                        roomType: 'Villa',
                        onTap: () => _navigateToGallery(context, 'Villa'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Recommended for You',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150, // Reduced size
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        RecommendationCard('Room A'),
                        RecommendationCard('Room B'),
                        RecommendationCard('Room C'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String roomType;
  final VoidCallback onTap;

  RoomCard({required this.roomType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              roomType,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String roomName;

  RecommendationCard(this.roomName);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            roomName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  final String roomType;

  GalleryPage({required this.roomType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$roomType Gallery'),
      ),
      body: Center(
        child: Text(
          'Gallery for $roomType',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
