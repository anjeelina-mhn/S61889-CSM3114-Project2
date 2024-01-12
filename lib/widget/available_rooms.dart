import 'package:flutter/material.dart';
import 'book_a_room.dart';
import 'login.dart';
import 'view_booking.dart';
import 'dashboard.dart';

class AvailableRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Rooms'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hotel Management App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.dashboard, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Dashboard'),
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.room, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Available Rooms'),
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AvailableRooms()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Book A Room'),
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BookARoom()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.view_list, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('View Booking'),
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBooking()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Below are a list of available rooms in our Hotel.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Classic Single Room:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Classic simple bedroom with 1 single bed. Great for a single tourist staycation!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM80',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/classicsingleroom.jpeg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Classic Twin Bed Room',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Classic simple bedroom with 2 single beds. Recommended for besties staycation!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM120',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/classictwinbedroom.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Classic King Bed Room',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Classic bedroom with 1 king bed. Great place to stay for lovebirds staycation!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM150',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/classickingbedroom.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Deluxe Double Room',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Deluxe bedroom with 2 queen beds. Great place for a small family to stay for vacation!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM200',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/deluxedoubleroom.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Superior Double Room',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Deluxe bedroom with 1 extra large king bed. Recommended for a group of friends to stay for vacation!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM260',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/superiordoubleroom.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Lux Suites',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Luxury suites can stay up to 6 pax. Recommended for a group of friends to stay for vacation!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM360',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/luxsuites.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Duplex',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Duplex of 2 stories. Great place to stay for a group of families with up to 10 pax!',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 2),
                Text(
                  'Price for 1 night: RM400',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Center(
                  child: Image.asset(
                    'assets/duplex.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
