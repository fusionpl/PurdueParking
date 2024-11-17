import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Import for calendar
import 'package:map_launcher/map_launcher.dart';


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
          _buildRecentItem(context, "Parking Rules", 'icon.png' ),
          _buildRecentItem(context, "Event Parking", 'icon.png'),
          _buildRecentItem(context, "Find Parking", 'icon.png'),
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
            MaterialPageRoute(builder: (context) =>  const ParkingRulesPage()),
          );
        } else if (title == "Event Parking") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const EventParkingPage()),
          );
        } else if (title == "Find Parking") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const FindParkingPage()),
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
              Image.asset(imagePath, width: 40, height: 40,),
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
        _buildFeatureItem(context, "Parking Rules", "Learn about Purdue Parking Rules"),
        _buildFeatureItem(context, "Special Event Parking", "Check out today’s calendar for any special restrictions"),
        _buildFeatureItem(context, "Find Parking", "Check analytics to see lot availability scores"),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String title, String subtitle) {
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
            MaterialPageRoute(builder: (context) =>  const EventParkingPage()),
          );
        }
        else if (title == "Find Parking") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const FindParkingPage()),
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
            const Icon(Icons.image, size: 40, color: Colors.grey),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking Rules"),
      ),
      body: const Center(
        child: Text(
          "Parking Rules",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
    DateTime.utc(2024, 11, 31): [Event("Men's Basketball Game")], // Added event
    DateTime.utc(2024, 11, 15): [Event("Move your cars - Home Football Game Tomorrow")],
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
      backgroundColor: const Color.fromRGBO(207,185,145,1.000),
      body: Column(
        children: [
          TableCalendar(
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
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary, // Gold for today's date
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary, // Black for selected date
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
          ),
          const SizedBox(height: 20),
          // Display events for the selected day
          Expanded(
            child: _buildEventList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    final events = _getEventsForDay(_selectedDay ?? _focusedDay);
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(events[index].title),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Parking Locations:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ParkingLocationCard(
              location: 'Lot A - North Russell St',
              availability: 'Available',
              latitude: 40.428492434603484,
              longitude: -86.91883460225058,
            ),
            ParkingLocationCard(
              location: 'Lot B - Discovery',
              availability: 'According to Analytics - Peak Hours',
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
          style: TextStyle(color: availability == 'Available' ? Colors.green : Colors.red),
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
                SnackBar(content: Text("No map apps installed")),
              );
            }
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Could not open the map")),
            );
          }
        },
      ),
    );
  }
}


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
