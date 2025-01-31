import 'package:flutter/material.dart';

void main() {
  runApp(CollegeJobFinderApp());
}

class CollegeJobFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Job Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobListScreen(),
    );
  }
}

class JobListScreen extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {
      'title': 'Software Engineer Intern',
      'company': 'Tech Corp',
      'location': 'Remote',
      'description': 'Work on cutting-edge technologies...',
    },
    {
      'title': 'Data Analyst',
      'company': 'Data Inc',
      'location': 'india, NY',
      'description': 'Analyze large datasets...',
    },
    {
      'title': 'Marketing Intern',
      'company': 'Market Masters',
      'location': 'Pune, CA',
      'description': 'Assist in marketing campaigns...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internships & Jobs'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jobs[index]['title']!),
            subtitle: Text(jobs[index]['company']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: jobs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class JobDetailScreen extends StatelessWidget {
  final Map<String, String> job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job['company']!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Location: ${job['location']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(job['description']!, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
