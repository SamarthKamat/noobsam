import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/bookings/bookings.dart';
import 'package:hotel_booking/screens/payment.dart';
import 'package:intl/intl.dart';

// For formatting dates

class SuiteBookingPage extends StatelessWidget {
  const SuiteBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double pricePerNight = 25000.0; // Updated price for Suite
    final double gst = 0.18; // GST rate
    final double totalAmount = pricePerNight * (1 + gst);

    final checkInDate = DateTime.now();
    final checkOutDate =
        DateTime.now().add(const Duration(days: 2)); // Extended stay for Suite
    final String formattedCheckIn =
        DateFormat('dd MMM yyyy').format(checkInDate);
    final String formattedCheckOut =
        DateFormat('dd MMM yyyy').format(checkOutDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suite Room Booking'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Suite Room Image Section
              Container(
                width: double.infinity,
                height: 250, // Adjusted height for Suite room image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/STUD2.png'), // Replace with Suite room image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Room Title and Price
              const Text(
                'Luxury Suite Room',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Price per Night: ₹${pricePerNight.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Facilities and Amenities with Icons
              const Text(
                'Facilities and Amenities:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wifi,
                          color: Colors.deepPurpleAccent, size: 30),
                      SizedBox(width: 10),
                      Text('Free High-Speed WiFi',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.ac_unit,
                          color: Colors.deepPurpleAccent, size: 30),
                      SizedBox(width: 10),
                      Text('Central Air Conditioning',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.pool,
                          color: Colors.deepPurpleAccent, size: 30),
                      SizedBox(width: 10),
                      Text('Private Infinity Pool',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.restaurant,
                          color: Colors.deepPurpleAccent, size: 30),
                      SizedBox(width: 10),
                      Text('Personal Chef & Gourmet Dining',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.spa, color: Colors.deepPurpleAccent, size: 30),
                      SizedBox(width: 10),
                      Text('In-Room Spa Services',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Total Amount Section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount (with GST):',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹${totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Booking Details Section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurpleAccent, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Booking Details',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Check-in Date: $formattedCheckIn',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Check-out Date: $formattedCheckOut',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Guests: 2 Adults, 0 Children',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Proceed to Payment Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingPage(
                          checkInDate: checkInDate,
                          checkOutDate: checkOutDate,
                          roomType: 'suite',
                          totalAmount: totalAmount,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
