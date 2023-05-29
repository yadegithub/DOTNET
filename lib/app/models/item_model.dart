

class item{
  String? title;
  String? category;
  String? thumb_url;
  String? location;
  String? price;


  item(this.title,this.category,this.location,this.price,this.thumb_url,);

static List<item> recommendation =[
  item("Modern House for Renting", "House", "Georgia , USA", '2500',
  "https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=400" ),
  item("Big Villa", "Villa", "Miami , USA", '3000',
  "https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=400" ),
  item("Small House", "House", "Wesex ,london", '1500',
  "https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=400" ),
  item("Luxios Apartement", "Apartement", "New york , USA", '800',
  "https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=400" ),
];


}