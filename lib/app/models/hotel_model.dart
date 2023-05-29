import 'package:equatable/equatable.dart';

class Hotels extends Equatable {
  const Hotels({
     this.catagory='',
     this.image ='',
     this.name='',
  
  });

  factory Hotels.fromJson(Map<String, dynamic> json) =>
      Hotels(
        catagory:json['catagory'],
        image:json['image'],
        name:json['name']
      );

 final String catagory;
 final  String image;
 final  String name;

  Map<String, dynamic> toJson() => {
        'catagory': catagory,
        'image':image,
        'name':name
        
      };

  @override
  List<Object?> get props => [
        catagory,
        image,
        name,
      ];
}
