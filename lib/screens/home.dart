import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotel_booking/constants/ImportFiles.dart';
import 'package:hotel_booking/screens/bookings/VillaBookingPage.dart';
import 'package:hotel_booking/screens/rooms/VillaGalleryPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentIndex = 0;

  final List<String> headerImages = [
    'assets/images/Homepage.jpg',
    'assets/images/HOME1.jpg',
    'assets/images/HOME2.jpg',
    'assets/images/HOME3.jpg',
    'assets/images/HOME4.jpg',
    'assets/images/HOME5.jpg',
  ];

  final List<String> roomTypes = [
    'Standard',
    'Premium',
    'Luxury',
    'Suite',
    'Villa'
  ];
  final List<String> imagePaths = [
    'assets/images/standardroom.jpg',
    'assets/images/Room-Premium-min.jpg',
    'assets/images/luxuryRoom.jpeg',
    'assets/images/suiteroom.jpg',
    'assets/images/villa.jpg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the tapped index
    final pages = [
      const HomeScreen(),
      const ProfilePage(),
      const BookingPage(
        checkInDate: null,
        checkOutDate: null,
        roomType: '',
        totalAmount: 0,
      ),
      const ContactUs(),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.04;

    return Scaffold(
      appBar: buildAppBar(context, screenSize),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderImage(screenSize),
            const SizedBox(height: 20),
            sectionTitle('Recommended for You', horizontalPadding),
            const SizedBox(height: 20),
            buildRecommendedForYou(screenSize),
            const SizedBox(height: 20),
            sectionTitle('Explore Our Rooms', horizontalPadding),
            const SizedBox(height: 10),
            buildRoomList(screenSize),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar(BuildContext context, Size screenSize) {
    return AppBar(
      toolbarHeight: screenSize.height * 0.1,
      automaticallyImplyLeading: false,
      title: Text(
        "Welcome to Simple Stays",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            logout(context);
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }

  Widget buildHeaderImage(Size screenSize) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: headerImages
              .map((imagePath) => Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            height: screenSize.height * 0.3,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: headerImages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == entry.key ? Colors.white : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Padding sectionTitle(String title, double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildRecommendedForYou(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: roomTypes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.04),
            child: RoomCard(
              width: screenSize.width * 0.5,
              imageHeight: screenSize.height * 0.2,
              roomName: '${roomTypes[index]} Room',
              imagePath: imagePaths[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      switch (roomTypes[index]) {
                        case 'Standard':
                          return const StandardBookingPage();
                        case 'Premium':
                          return const PremiumBookingPage();
                        case 'Luxury':
                          return LuxuryBookingPage();
                        case 'Suite':
                          return const SuiteBookingPage();
                        case 'Villa':
                          return const VillaBookingPage();
                        default:
                          return const StandardBookingPage();
                      }
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildRoomList(Size screenSize) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: roomTypes.length,
      itemBuilder: (context, index) {
        final colors = [
          Colors.orange.shade200,
          const Color.fromARGB(255, 241, 225, 83),
          Colors.cyan.shade300,
          Colors.pink.shade300,
          Colors.purple.shade300
        ];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  switch (roomTypes[index]) {
                    case 'Standard':
                      return const StandardRoomGalleryPage();
                    case 'Premium':
                      return const PremiumRoomGalleryPage();
                    case 'Luxury':
                      return const LuxuryRoomGalleryPage();
                    case 'Suite':
                      return const SuiteRoomGalleryPage();
                    case 'Villa':
                      return const VillaRoomGalleryPage();
                    default:
                      return const StandardRoomGalleryPage();
                  }
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenSize.height * 0.15,
              decoration: BoxDecoration(
                color: colors[index].withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: colors[index].withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '${roomTypes[index]} Room',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Book'),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_page), label: 'Contact'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 0, 130, 125),
      onTap: _onItemTapped,
    );
  }
}

class RoomCard extends StatelessWidget {
  final double width;
  final double imageHeight;
  final String roomName;
  final String imagePath;
  final VoidCallback onTap;

  const RoomCard({
    Key? key,
    required this.width,
    required this.imageHeight,
    required this.roomName,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              roomName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
