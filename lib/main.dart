import 'package:flutter/material.dart';

void main() {
  runApp(MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Assistant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Mental Health Status Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.blue.shade100,
              child: ListTile(
                leading: const Icon(Icons.favorite, color: Colors.red),
                title: const Text('Mental Health Status'),
                subtitle: const Text('Click to check your current status'),
                onTap: () {
                  // TODO: Navigate to mental health status page
                },
              ),
            ),
            const SizedBox(height: 20),

            // Chatbot to seek help
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green.shade100,
              child: ListTile(
                leading: const Icon(Icons.chat, color: Colors.green),
                title: const Text('Chatbot Assistance'),
                subtitle: const Text('Talk to our AI assistant for help'),
                onTap: () {
                  // TODO: Navigate to chatbot page
                },
              ),
            ),
            const SizedBox(height: 20),

            // Chat with a real therapist
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.orange.shade100,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.orange),
                title: const Text('Chat with a Therapist'),
                subtitle: const Text('Connect with a professional therapist'),
                onTap: () {
                  // TODO: Navigate to therapist chat page
                },
              ),
            ),
            const SizedBox(height: 20),

            // Chat with peers
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.purple.shade100,
              child: ListTile(
                leading: const Icon(Icons.group, color: Colors.purple),
                title: const Text('Chat with Peers'),
                subtitle: const Text('Join our community to talk with peers'),
                onTap: () {
                  // TODO: Navigate to peer chat page
                },
              ),
            ),
            const SizedBox(height: 20),

            // Settings and Profile Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to settings
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to profile
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
