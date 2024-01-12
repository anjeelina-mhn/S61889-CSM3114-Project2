import 'package:flutter/material.dart';
import 'package:new_hotel_management/widget/available_rooms.dart';
import 'book_a_room.dart';
import 'login.dart';
import 'view_booking.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
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
                    'Welcome to Hotel Management App! Plan your stay with us effortlessly and enjoy a luxurious experience. '
                    'Explore our user-friendly features to book your ideal room and manage your reservations seamlessly. '
                    'We are dedicated to ensuring your comfort throughout your stay. Your satisfaction is our top priority.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/hotel.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Check out our available rooms in Available Rooms Page!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 10),
                Text(
                  'Note: Any payments will be summarized in hotel reception.',
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
