class  RecommandedPlaceModel{

  final String image;
   final double rating;
   final String location;
   final String type;
   final  bool isFav;
   final double price;
   final int bedrooms;
   final int bathrooms;
   final double surface;
   final int sale;
   
   RecommandedPlaceModel({
    required this.image,
    required this.location,
    required this.rating,
    required this.type,
    required this.isFav,
    required this.price,
    required this.bathrooms,
    required this.bedrooms,
    required this.surface,
    required this.sale
   });


   toJson(){
    return{};
   }

}
List<RecommandedPlaceModel> recommendedplaces =[
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Noukchott",
rating: 4.4,
type: "House",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Noudibou",
rating: 4.4,
type: "Appartement",
isFav: false,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Noukchot",
rating: 4.4,
type: "Villa",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Magtaa lhjar",
rating: 4.4,
type: "House",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Magtaa lhjar",
rating: 4.4,
type: "House",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Magtaa lhjar",
rating: 4.4,
type: "House",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Magtaa lhjar",
rating: 4.4,
type: "House",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),
RecommandedPlaceModel(image: 'assets/images/img_destination_ambon.jpeg',
location: "Magtaa lhjar",
rating: 4.4,
type: "House",
isFav: true,
price: 1222,
bathrooms: 4,
bedrooms: 2,
surface: 1.45,
sale: 4
),

];