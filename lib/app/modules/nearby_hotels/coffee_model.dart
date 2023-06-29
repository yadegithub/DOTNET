import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;
   //String titleTxt;
  String subTxt;
  double rating;

  Coffee(
      {required this.shopName,
      required this.address,
      required this.description,
      required this.thumbNail,
      required this.locationCoords,
      required this.subTxt,
    //  required this.titleTxt,
      required this.rating
      });
}

final List<Coffee> coffeeShops = [
  Coffee(
      shopName: 'URBAN HOTEL NOUAKCHOTT',
      address: 'BP 1920, Mauritania',
      description:
          'Coffee bar chain offering house-roasted direct-trade coffee, along with brewing gear & whole beans',
      locationCoords: LatLng(18.115911043733117, -15.97781673288101),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no',
      subTxt: 'Royal gggg',
      rating: 4.5 
      ),
  Coffee(
      shopName: 'فندق انواكشوط',
      address: 'Nouakchott, Mauritania',
      description:
          'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(18.108199206462587, -15.985963062312265),
      
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no',
       subTxt: 'Royal gggg',
      rating: 4.5 
      ),
  Coffee(
      shopName: 'فندق فلورا',
      address: 'Sahraui Rue Abdel Wahab Cheiguer, Nouakchott, Mauritania',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: LatLng(18.12418807884656, -15.97253055956549),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no',
       subTxt: 'Royal gggg',
      rating: 4.5 
      ),
  Coffee(
      shopName: 'Hôtel El aziza فندق العزيزة',
      address: 'Nouakchott, Mauritania',
      description:
          'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
      locationCoords: LatLng(18.115553646544125, -15.978787489601995),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no',
       subTxt: 'Royal gggg',
      rating: 4.5 
      ),
  Coffee(
      shopName: 'فندق حليمةHôtel Halima',
      address: ' Nouakchott, Mauritania',
      description:
          'Compact coffee & espresso bar turning out drinks made from direct-trade beans in a low-key setting.',
      locationCoords: LatLng(18.099994211636087, -15.974153302976566),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no',
       subTxt: 'Royal gggg',
      rating: 4.5 
      )
];

