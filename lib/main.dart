import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Import for calendar
import 'package:map_launcher/map_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PurdueParkingApp());
}

class PurdueParkingApp extends StatelessWidget {
  const PurdueParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purdue Parking',
      theme: ThemeData(
        primaryColor: const Color(0xFF000000),  // Gold for accent color
        scaffoldBackgroundColor:const Color(0xFFB39424),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000),
          iconTheme: IconThemeData(color: Color(0xFFB39424)),
          foregroundColor: Color(0xFFB39424),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.black),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFB39424), // Gold color for buttons
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFB39424)),
      ),
      home: const PurdueParkingScreen(),
    );
  }
}

class PurdueParkingScreen extends StatelessWidget {
  const PurdueParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purdue Parking"),
      
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildRecentsList(context),
            const SizedBox(height: 20),
            const Text("Parking Features", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildFeaturesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentsList(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRecentItem(context, "Parking Rules", 'assets/rules.png' ),
          _buildRecentItem(context, "Event Parking", 'assets/calendar.png'),
          _buildRecentItem(context, "Find Parking", 'assets/parking-sign.png'),
        ],
      ),
    );
  }

  Widget _buildRecentItem(BuildContext context, String title, String imagePath) {
  return GestureDetector(
    onTap: () {
      if (title == "Parking Rules") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ParkingRulesPage()),
        );
      } else if (title == "Event Parking") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventParkingPage()),
        );
      } else if (title == "Find Parking") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FindParkingPage()),
        );
      }
    },
    child: Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildFeaturesList(BuildContext context) {
  return Column(
    children: [
      _buildFeatureItem(
        context,
        "Parking Rules",
        "Learn about Purdue Parking Rules",
        'assets/parking_rules.jpeg',
      ),
      _buildFeatureItem(
        context,
        "Special Event Parking",
        "Check out today’s calendar for any special restrictions",
        'assets/special.jpeg',
      ),
      _buildFeatureItem(
        context,
        "Find Parking",
        "Check analytics to see lot availability scores",
        'assets/find_parking.jpeg',
      ),
    ],
  );
}

  Widget _buildFeatureItem(
    BuildContext context, String title, String subtitle, String imagePath) {
  return GestureDetector(
    onTap: () {
      if (title == "Parking Rules") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ParkingRulesPage()),
        );
      } else if (title == "Special Event Parking") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventParkingPage()),
        );
      } else if (title == "Find Parking") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FindParkingPage()),
        );
      }
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40, height: 40), // Use imagePath here
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.grey[600]),
        ],
      ),
    ),
  );
}
}

// Pages for each card and navigation item
class ParkingRulesPage extends StatelessWidget {
  const ParkingRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rules = [
      "Faculty, staff and students must be registered for a parking permit when parking on campus and park so the license plate faces the drive lane.",
      "Visitors may park in the Grant Street Parking Garage or Harrison Street Parking Garage (hourly fees apply) or in metered parking spaces without a parking permit.",
      "Daily visitor permits may be obtained from the online parking portal for a rate of 5.00 per day",
      "Monday through Friday, 7 a.m. to 5 p.m., license plates of each vehicle parked on the West Lafayette campus are required to be linked to a valid Purdue parking permit unless posted otherwise. Some parking spaces are enforced 24/7.",
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking Rules"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: rules.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  rules[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class EventParkingPage extends StatefulWidget {
  const EventParkingPage({super.key});
    @override
  _EventParkingPageState createState() => _EventParkingPageState();
}

class _EventParkingPageState extends State<EventParkingPage> {
  
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Predefined events map with a "Football Game" event on November 30
  final Map<DateTime, List<Event>> _events = {
    DateTime.utc(2024, 11, 10): [Event("Volleyball Game"), Event("Women's Basketball Game")],
    DateTime.utc(2024, 11, 11): [Event("Men's Basketball Game")], // Added event
    DateTime.utc(2024, 11, 22): [Event("Men's Basketball Game - vehicles towed if they're in A, AA, C, F, G, H (upper & lower), J*, K, M, N, P, Q, R, U, Y, Z")],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Special Event Parking"),
    ),
    backgroundColor: const Color(0xFFB39424), // Golden page background
    body: Column(
      children: [
        // Calendar Section
        Container(
          margin: const EdgeInsets.all(16.0), // Add spacing around the calendar
          padding: const EdgeInsets.all(12.0), // Add padding inside the container
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFf7f7f7), Color(0xFFe6e6e6)], // Subtle gradient background
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Soft shadow
                blurRadius: 10.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color(0xFFD4AF37), // Gold for today's date
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.black, // Black for selected date
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.redAccent), // Red text for weekends
              defaultTextStyle: TextStyle(fontWeight: FontWeight.bold), // Bold text for all days
              outsideDaysVisible: false,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        // Selected Day Events Section
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white, // Clean white background for the event list
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: _buildEventList(), // Use the existing event list builder
          ),
        ),
      ],
    ),
  );
}



 Widget _buildEventList() {
  final events = _getEventsForDay(_selectedDay ?? _focusedDay);
  
  if (events.isEmpty) {
    return Center(
      child: Text(
        "Special events/rules will be displayed here",
        style: TextStyle(
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
          color: Colors.grey[700], // Subtle grey text
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  return ListView.builder(
    itemCount: events.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(
          events[index].title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.event, // Event icon
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    },
  );
}
}

class FindParkingPage extends StatelessWidget {
  const FindParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Parking'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Parking Locations:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ParkingLocationCard(
              location: 'Lot A - North Russell St',
              availability: 'Available: 15/30 Spots Available',
              latitude: 40.428492434603484,
              longitude: -86.91883460225058,
            ),
            ParkingLocationCard(
              location: 'Lot B - Discovery',
              availability: 'Peak Hours: Only 10/60 spots available',
              latitude: 40.419446279810856,  
              longitude: -86.92328961131224,
            ),
          ],
        ),
      ),
    );
  }
}
class ParkingLocationCard extends StatelessWidget {
  final String location;
  final String availability;
  final double latitude;
  final double longitude;

  const ParkingLocationCard({
    super.key,
    required this.location,
    required this.availability,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          location,
          style: const TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          availability,
          style: TextStyle(color: availability == 'Available: 15/30 Spots Available' ? Colors.green : Colors.red),
        ),
        trailing: const Icon(Icons.directions, color: Colors.blue),
        onTap: () async {
          try {
            final availableMaps = await MapLauncher.installedMaps;
            if (availableMaps.isNotEmpty) {
              await availableMaps.first.showMarker(
                coords: Coords(latitude, longitude),
                title: location,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No map apps installed")),
              );
            }
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Could not open the map")),
            );
          }
        },
      ),
    );
  }
}

/*class FindParkingPage extends StatelessWidget {
  const FindParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Parking'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Parking Locations:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ParkingLocationCard(
              location: 'Lot A - North Russell St',
              availability: '15/30 Spots Available',
              latitude: 40.428492434603484,
              longitude: -86.91883460225058,
            ),
            ParkingLocationCard(
              location: 'Lot B - Discovery',
              availability: 'Only 10/60 Spots available',
              latitude: 40.419446279810856,
              longitude: -86.92328961131224,
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingLocationCard extends StatelessWidget {
  final String location;
  final String availability;
  final double latitude;
  final double longitude;

  const ParkingLocationCard({
    super.key,
    required this.location,
    required this.availability,
    required this.latitude,
    required this.longitude,
  });

  // Function to open Google Maps with coordinates
  void _launchGoogleMaps(double latitude, double longitude) async {
    final googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw "Could not launch $googleMapsUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          location,
          style: const TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          availability,
          style: TextStyle(color: availability == 'Available' ? Colors.green : Colors.red),
        ),
        trailing: const Icon(Icons.directions, color: Colors.blue),
        onTap: () {
          _launchGoogleMaps(latitude, longitude);
        },
      ),
    );
  }
}

*/
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: const Center(
        child: Text(
          "Account Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const Center(
        child: Text(
          "Notifications Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Center(
        child: Text(
          "Settings Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
class Event {
  final String title;
  Event(this.title);

  @override
  String toString() => title;
}
