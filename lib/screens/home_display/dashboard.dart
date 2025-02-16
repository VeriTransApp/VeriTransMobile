import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Pearl Chambers'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map Placeholder
            Container(
              height: 300,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Map Placeholder',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ),
            ),
            // Search Bar and Buttons
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 220),
                    child: Text('Where are you going?', style: TextStyle(fontStyle: FontStyle.italic),),
                  ),
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  _buildActionButtons(),
                  const SizedBox(height: 20),
                  _buildPreviousRide(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//search option
Widget _buildSearchBar() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Book an EV Ride',
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: InputBorder.none,
        icon: const Icon(Icons.search, color: Colors.grey),
      ),
    ),
  );
}
  

//
Widget _buildActionButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      _buildActionButton('Book a Bus', Icons.directions_car),
      const SizedBox(width: 30,),
      _buildActionButton('Flight Tickets', Icons.airplanemode_active),
    ],
  );
}

Widget _buildActionButton(String label, IconData icon) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white), 
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontSize: 14)),
    ],
  );
}


//
Widget _buildPreviousRide() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 2),
    )],
    ),
    child: const Row(
      children: [
        Icon(Icons.history, color: Colors.blue),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Previous Ride', style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text('Accra Mall, Accra', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ],
    ),
  );
}