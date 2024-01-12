import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_hotel_management/widget/available_rooms.dart';
import 'dart:convert';
import 'package:new_hotel_management/widget/book_a_room.dart';
import 'package:new_hotel_management/widget/dashboard.dart';
import 'package:new_hotel_management/widget/login.dart';

class ViewBooking extends StatefulWidget {
  @override
  _ViewBookingState createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  List<Map<String, dynamic>> bookedRooms = [];

  @override
  void initState() {
    super.initState();
    _fetchBookedRooms();
  }

  Future<void> _fetchBookedRooms() async {
    try {
      final url = Uri.https(
        'hotelmanagementapp-c4326-default-rtdb.asia-southeast1.firebasedatabase.app',
        'booked_rooms.json',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> rooms = [];

        data.forEach((key, value) {
          rooms.add({'id': key, ...value});
        });

        setState(() {
          bookedRooms = rooms;
        });
      } else {
        print('Failed to fetch booked rooms: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching booked rooms: $error');
    }
  }

  Future<void> _deleteBooking(String bookingId) async {
    try {
      final url = Uri.https(
        'hotelmanagementapp-c4326-default-rtdb.asia-southeast1.firebasedatabase.app',
        'booked_rooms/$bookingId.json',
      );

      final response = await http.delete(url);

      if (response.statusCode == 200) {
        _fetchBookedRooms();
      } else {
        print('Failed to delete booking: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting booking: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Booking'),
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
      drawer: buildSideDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Confirmed Bookings:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              // Display booked rooms
              Expanded(
                child: ListView.builder(
                  itemCount: bookedRooms.length,
                  itemBuilder: (context, index) {
                    final room = bookedRooms[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        title: Text('Room Type: ${room['roomType']}'),
                        subtitle: Text(
                          'Date: ${room['date']}, No of Pax: ${room['noOfPax']}, No of Nights: ${room['noOfNights']}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Delete Booking'),
                                content: Text(
                                    'Are you sure you want to delete this booking?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _deleteBooking(room['id']);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildSideDrawer(BuildContext context) {
    return Drawer(
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
    );
  }
}
