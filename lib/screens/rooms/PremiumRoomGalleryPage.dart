import 'package:flutter/material.dart';

class PremiumRoomGalleryPage extends StatefulWidget {
  const PremiumRoomGalleryPage({super.key});

  @override
  _PremiumRoomGalleryPageState createState() => _PremiumRoomGalleryPageState();
}

class _PremiumRoomGalleryPageState extends State<PremiumRoomGalleryPage> {
  @override
  Widget build(BuildContext context) {
    // Multiple image groups for the Premium Room gallery
    final List<String> imageList = [
      'assets/images/PR1.png',
      'assets/images/PR2.png',
      'assets/images/PR3.png',
      'assets/images/PR4.png',
      'assets/images/PR5.png', // Add more images as needed
    ];

    const String description =
        'Premium room offering more space and luxurious decor.';
    const String bedDetails = '1 Queen Size Bed + 1 Single Bed';
    const String amenities = 'Free Wi-Fi, TV, Mini-Bar, Bathtub';
    const String extraBedCharges = '₹800 per night';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium Room Gallery'),
        backgroundColor:
            Colors.deepPurpleAccent, // Aesthetic touch for the app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel with multiple images
            SizedBox(
              height: 250, // Adjusted to accommodate multiple images
              child: PageView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Room Details Section with Card Layout
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Premium Room',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Bed Type: $bedDetails',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Amenities: $amenities',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Extra Bed Charges: $extraBedCharges',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
