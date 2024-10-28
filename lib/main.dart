import 'package:flutter/material.dart';

void main() {
  runApp(const MentalHealthApp());
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
      home: const HomePage(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MentalHealthStatusPage()),
                  );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileLoginPage()),
                    );
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

class ProfileLoginPage extends StatefulWidget {
  const ProfileLoginPage({super.key});

  @override
  _ProfileLoginPageState createState() => _ProfileLoginPageState();
}

class _ProfileLoginPageState extends State<ProfileLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://images.app.goo.gl/iPPCNB45ah8SVt2P9',
                    ),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MentalHealthStatusPage extends StatefulWidget {
  const MentalHealthStatusPage({super.key});

  @override
  _MentalHealthStatusPageState createState() => _MentalHealthStatusPageState();
}

class _MentalHealthStatusPageState extends State<MentalHealthStatusPage> {
  int moodRating = 3;
  String sleepQuality = 'Normal';
  String eatingQuality = 'Balanced';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rate your mood today:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: moodRating.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: moodRating.toString(),
              onChanged: (value) {
                setState(() {
                  moodRating = value.toInt();
                });
              },
            ),
            const Text(
              'Your sleep quality today:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: sleepQuality,
              onChanged: (String? newValue) {
                setState(() {
                  sleepQuality = newValue!;
                });
              },
              items: <String>['Good', 'Normal', 'Bad']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'How was your eating today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: eatingQuality,
              onChanged: (String? newValue) {
                setState(() {
                  eatingQuality = newValue!;
                });
              },
              items: <String>['Balanced', 'Overate', 'Undereat']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text(
              'Status Summary:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Mood Rating: $moodRating',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Sleep Quality: $sleepQuality',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Eating Quality: $eatingQuality',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
