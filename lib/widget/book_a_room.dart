import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_hotel_management/widget/available_rooms.dart';
import 'package:new_hotel_management/widget/dashboard.dart';
import 'login.dart';
import 'booking_confirmation.dart';
import 'view_booking.dart';

class BookARoom extends StatefulWidget {
  @override
  _BookARoomState createState() => _BookARoomState();
}

class _BookARoomState extends State<BookARoom> {
  final TextEditingController dateController = TextEditingController();
  String selectedRoomType = 'Classic Single Room';
  int selectedNoOfPax = 1;
  int selectedNoOfNights = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book A Room'),
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
              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Date (MM/DD/YYYY)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'No of Nights:',
                style: TextStyle(fontSize: 18.0),
              ),
              DropdownButton<int>(
                value: selectedNoOfNights,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedNoOfNights = newValue!;
                  });
                },
                items: List.generate(5, (index) => index + 1)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Room Type:',
                style: TextStyle(fontSize: 18.0),
              ),
              DropdownButton<String>(
                value: selectedRoomType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRoomType = newValue!;
                  });
                },
                items: [
                  'Classic Single Room',
                  'Classic Twin Bed Room',
                  'Classic King Bed Room',
                  'Deluxe Double Room',
                  'Superior Double Room',
                  'Lux Suites',
                  'Duplex'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'No of Pax:',
                style: TextStyle(fontSize: 18.0),
              ),
              DropdownButton<int>(
                value: selectedNoOfPax,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedNoOfPax = newValue!;
                  });
                },
                items: List.generate(10, (index) => index + 1)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () async {
                  await _bookRoom(
                    dateController.text,
                    selectedRoomType,
                    selectedNoOfPax,
                    selectedNoOfNights, 
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmation(
                        selectedDate: dateController.text,
                        selectedRoomType: selectedRoomType,
                        selectedNoOfPax: selectedNoOfPax,
                        selectedNoOfNights:
                            selectedNoOfNights, 
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: Text(
                  'Book Room',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _bookRoom(
    String date,
    String roomType,
    int noOfPax,
    int noOfNights,
  ) async {
    try {
      final url = Uri.https(
        'hotelmanagementapp-c4326-default-rtdb.asia-southeast1.firebasedatabase.app',
        'booked_rooms.json',
      );

      final response = await http.post(
        url,
        body: json.encode({
          'date': date,
          'roomType': roomType,
          'noOfPax': noOfPax,
          'noOfNights': noOfNights,
        }),
      );

      if (response.statusCode >= 400) {
        print('Error storing booked room data: ${response.body}');
      }
    } catch (error) {
      print('Error booking room: $error');
    }
  }
}
