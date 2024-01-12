import 'package:flutter/material.dart';
import 'package:new_hotel_management/widget/available_rooms.dart';
import 'package:new_hotel_management/widget/book_a_room.dart';
import 'package:new_hotel_management/widget/dashboard.dart';
import 'package:new_hotel_management/widget/view_booking.dart';
import 'package:new_hotel_management/widget/login.dart';

class BookingConfirmation extends StatelessWidget {
  final String selectedDate;
  final String selectedRoomType;
  final int selectedNoOfPax;
  final int selectedNoOfNights; 

  BookingConfirmation({
    required this.selectedDate,
    required this.selectedRoomType,
    required this.selectedNoOfPax,
    required this.selectedNoOfNights, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Booking Confirmed',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Text(
                'Congratulations! You have booked $selectedRoomType for $selectedNoOfPax people for $selectedNoOfNights nights on $selectedDate.',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Please check in after 2pm and check out time is before 12pm. Thank you for booking with us!',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ViewBooking()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: Text(
                  'View your Booking',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
