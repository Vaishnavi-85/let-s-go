import 'package:flutter/material.dart';

void main() => runApp(TripPlannerApp());

class TripPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Trip Planner',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TripPlannerHome(),
    );
  }
}

class TripPlannerHome extends StatefulWidget {
  @override
  _TripPlannerHomeState createState() => _TripPlannerHomeState();
}

class _TripPlannerHomeState extends State<TripPlannerHome> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final List<Map<String, String>> _tripPlans = [];

  void _addTrip() {
    final String destination = _destinationController.text.trim();
    final String budget = _budgetController.text.trim();

    if (destination.isEmpty || budget.isEmpty) return;

    setState(() {
      _tripPlans.add({'destination': destination, 'budget': budget});
    });

    _destinationController.clear();
    _budgetController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Trip Planner'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
                hintText: 'Enter destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Budget (in \$)',
                hintText: 'Enter budget',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTrip,
              child: Text('Add Trip'),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Trip Plans:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _tripPlans.isEmpty
                  ? Center(child: Text('No trips added yet.'))
                  : ListView.builder(
                      itemCount: _tripPlans.length,
                      itemBuilder: (context, index) {
                        final trip = _tripPlans[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.location_on, color: Colors.blue),
                            title: Text(trip['destination'] ?? ''),
                            subtitle: Text('Budget: \$${trip['budget']}'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
