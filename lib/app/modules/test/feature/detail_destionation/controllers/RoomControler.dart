import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../models/room_model.dart';

class RoomController extends GetxController {
  late final String roomId;

  final _db = DatabaseService();

  late final Rx<Map<String, dynamic>> room;

  @override
  void onInit() {
    super.onInit();
    room = Rx<Map<String, dynamic>>({});
    _fetchRoomData();
  }

  Future<void> _fetchRoomData() async {
    try {
      final roomData = await _db.getRoomById(roomId);
      room.value = roomData; // if you're not using a stream, you can access the data directly from roomData
    } catch (e) {
      print('Error getting room data: $e');
    }
  }

  Future<void> getRoomById(String id) async {
    try {
      // Call the database service to get the room data
      final roomData = await DatabaseService().getRoomById(id);
      // Convert the room data to a Room object using the Room.fromJson factory method
      final roomObject = Room.fromJson(roomData);
      // Update the room variable with the new Room object
      room.value = roomObject as Map<String, dynamic>;
    } catch (e) {
      // Handle any errors that occur during the database call
      print('Error getting room data: $e');
    }
  }

  // ...
}





class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a room by its ID
  Future<Map<String, dynamic>> getRoomById(String id) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> roomSnapshot = await _db.collection('rooms').doc(id).get();
      return roomSnapshot.data()!;
    } catch (e) {
      print('Error getting room data: $e');
      rethrow;
    }
  }

  // Create a new booking in the database
  Future<void> createBooking(Map<String, dynamic> bookingData) async {
    try {
      await _db.collection('Booking').add(bookingData);
    } catch (e) {
      print('Error creating booking: $e');
      rethrow;
    }
  }
}