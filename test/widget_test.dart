import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF000000),  // Black as primary color
          secondary: const Color(0xFFB39424), // Gold as secondary color
          surface: const Color(0xFFB39424), // Gold for scaffold background
        ),
        scaffoldBackgroundColor: const Color(0xFFB39424), // Gold background for app
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000), // Black app bar
          iconTheme: IconThemeData(color: Color(0xFFB39424)), // Gold for icons in app bar
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white), // AppBar title
          bodyMedium: TextStyle(color: Colors.black), // General body text color
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF000000), // Black buttons
          textTheme: ButtonTextTheme.primary,
        ),
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
            const Text(
              "Recents",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            _buildRecentsList(context),
            const SizedBox(height: 20),
            const Text(
              "Parking Features",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
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
          _buildRecentItem(context, "Parking Rules"),
          _buildRecentItem(context, "Event Parking"),
          _buildRecentItem(context, "Find Parking"),
        ],
      ),
    );
  }

  Widget _buildRecentItem(BuildContext context, String title) {
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
          color: Theme.of(context).colorScheme.secondary, // Gold background
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image, size: 40, color: Colors.black), // Black icon
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.black),
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
            MaterialPageRoute(builder: (context) => const EventParkingPage()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, // Gold background
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.image, size: 40, color: Colors.black),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

// Additional classes for each page
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Special Event Parking"),
      ),
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
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary, // Gold for today
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary, // Black for selected day
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
          ),
          const SizedBox(height: 20),
          if (_selectedDay != null)
            Text(
              'Selected date: ${_selectedDay!.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}

class FindParkingPage extends StatelessWidget {
  const FindParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Parking"),
      ),
      body: const Center(
        child: Text(
          "Find Parking",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
