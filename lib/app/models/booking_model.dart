
import 'package:equatable/equatable.dart';
import 'package:flextrip/app/models/hotel_model.dart';
import 'package:flextrip/app/models/user_model.dart';

import 'hotel_model.dart';

// class Booking extends Equatable {
//   const Booking({
//     // this.destination = const DestinationModel(),
//     // this.ticket = const DestinationTicketModel(),
//     // this.departureSchedule = 0,
//     // this.transactionDate = 0,
//     // this.totalPassenger = 0,
//     // this.selectedSeat = '',
//     // this.total = 0,
//     // this.refNumber = '',
//     // this.userId = '',
       
//        this.hotel = const Hotels(),
//        this.activities='',
//        this.breakfast='',
//        this.check_in_time=0,
//        this.cover=true,
//        this.date='',
//        this.guest=0,
//        this.is_done=true,
//        this.location='',
//        this.name='',
//        this.right='',
//        this.service_fee='',
//        this.status='',
//        this.total_payement=0,
//          id_hotel,
         
      




//   });

//   factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        
//         id_hotel:Hotels.fromJson(json['hotel']),
        
//         activities: json['activities'],
//         breakfast: json['breakfast'],
//         check_in_time: json['check_in_time'],
//         cover: json['cover'],
//         date: json['date'],
//         guest: json['guest'],
//         is_done: json['is_done'],
//         location:json['location'],
//         name:json['name'],
//         right:json['right'],
//         service_fee:json['service_fee'],
//         status:json['status'],
//         total_payement:json['total_payement']
//       );

  
//   final Hotels hotel;
//   final String activities;
//   final String breakfast;
//   final int check_in_time;
//   final bool cover;
//   final String date;
//   final int guest;

//   final bool is_done;
//   final String location;
//   final String name;
//   final String right;
//   final String service_fee;
//   final String status;
//   final double total_payement;

//   @override
//   List<Object?> get props => [
  
//     hotel,
//     activities,
//     breakfast,
//     check_in_time,
//     cover,
//     date,
//     guest,
//     is_done,
//     location,
//     name,
//     right,
//     service_fee,
//     status,
//     total_payement
       
//       ];
// }



class Booking {
  
  final String userId;
  final String roomId;
  final String bookingDate;
  final String status;
  final String breakfast;
   final String check_in_time;
   final bool cover;
   
   final int guest;

   final bool is_done;
   final String location;
   final String name;
   final String right;
   final String service_fee;
  
   final double total_payement;
  

  Booking({
    //required this.id,
     this.userId='',
     this.roomId='',
    this.bookingDate='',
     this.status='',
     this.breakfast='',
    this.check_in_time='',
     this.cover=true,
     this.guest=1,
     this.service_fee='',
     this.name='',
     this.is_done=true,
     this.right='',
     this.location='',
     this.total_payement=00
    
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      
      userId: json['userId'],
      roomId: json['roomId'],
      bookingDate:json['date'],
      status: json['status'],
        breakfast: json['breakfast'],
         check_in_time: json['check_in_time'],
         cover: json['cover'],
         
         guest: json['guest'],
         is_done: json['is_done'],
        location:json['location'],
         name:json['name'],
         right:json['right'],
         service_fee:json['service_fee'],
         
         total_payement:json['total_payement']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'userId': userId,
      'roomId': roomId,
      'Date': bookingDate,
      'status': status,
      'breakfast':breakfast,
      
       'check_in_time':check_in_time,
         'cover':cover,
         
         'guest':guest,
         'is_done':is_done,
         'location':location,
           'name':name,
           'right':right,
           'service_fee':service_fee,
         'total_payement':total_payement
         
         
         

    };
  }
}