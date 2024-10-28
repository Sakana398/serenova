import 'package:flutter/material.dart';

void main() {
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),6
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Assistant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 30),

            // Mental Health Status Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.blue.shade100,
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text('Mental Health Status'),
                subtitle: Text('Click to check your current status'),
                onTap: () {
                  // TODO: Navigate to mental health status page
                },
              ),
            ),
            SizedBox(height: 20),

            // Chatbot to seek help
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green.shade100,
              child: ListTile(
                leading: Icon(Icons.chat, color: Colors.green),
                title: Text('Chatbot Assistance'),
                subtitle: Text('Talk to our AI assistant for help'),
                onTap: () {
                  // TODO: Navigate to chatbot page
                },
              ),
            ),
            SizedBox(height: 20),

            // Chat with a real therapist
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.orange.shade100,
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.orange),
                title: Text('Chat with a Therapist'),
                subtitle: Text('Connect with a professional therapist'),
                onTap: () {
                  // TODO: Navigate to therapist chat page
                },
              ),
            ),
            SizedBox(height: 20),

            // Chat with peers
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.purple.shade100,
              child: ListTile(
                leading: Icon(Icons.group, color: Colors.purple),
                title: Text('Chat with Peers'),
                subtitle: Text('Join our community to talk with peers'),
                onTap: () {
                  // TODO: Navigate to peer chat page
                },
              ),
            ),
            SizedBox(height: 20),

            // Settings and Profile Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to settings
                  },
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to profile
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => ProfileLoginPage()),
                    );
                    
                  },
                  icon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
