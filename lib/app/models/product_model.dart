
class ProductModel {
  final String name;
  final String asset;
  final String location;
  final double rating;
  final int price;
  final String headline;
  final String desc;
  final List<String> testimonials;
  final List<String> photos;

  ProductModel({
    required this.name,
    required this.asset,
    required this.location,
    required this.rating,
    required this.price,
    required this.headline,
    required this.desc,
    required this.testimonials,
    required this.photos
  });
}


 final place1 = ProductModel(
    name: "Machu Picchu",
    asset: "assets/images/machu.jpeg",
    location: "Peru",
    rating: 4.5,
    price: 999,
    headline: "One of the Best Place on Earth",
    desc:
        "Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement.",
    testimonials: [
      "assets/images/profile_1.jpeg",
      "assets/images/profile_2.jpeg",
      "assets/images/profile_3.jpeg",
      "assets/images/profile_4.jpeg",
    ],
    photos: [
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      
      
      
    ],
  );
  final place2 = ProductModel(
    name: "Grand Canyon",
    asset: "assets/images/canyon.jpeg",
    location: "Arizona",
    rating: 4.5,
    price: 999,
    headline: "One of the Best Place on Earth",
    desc:
        "This incredible sight, one of the seven natural wonders of the world, is in the U.S. state of Arizona. It's one of those beautiful places for which photos or video just don't do it justice-its sheer size and scope is hard to comprehend.",
    testimonials: [
      "assets/images/profile_1.jpeg",
      "assets/images/profile_2.jpeg",
      "assets/images/profile_3.jpeg",
      "assets/images/profile_4.jpeg",
    ],
     photos: [
       "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      

      
    ],
  );
  final place3 = ProductModel(
    name: "Rome",
    asset: "assets/images/rome.jpeg",
    location: "Italy",
    rating: 4.5,
    price: 999,
    headline: "One of the Best Place on Earth",
    desc:
        "The Eternal City is more like a giant, living museum. Visitors are immersed in and surrounded by thousands of years of history. It's a relatively compact city, and a three-day itinerary gets you to the minimum number of must-see places.",
    testimonials: [
      "assets/images/profile_1.jpeg",
      "assets/images/profile_2.jpeg",
      "assets/images/profile_3.jpeg",
      "assets/images/profile_4.jpeg",
    ],
     photos: [
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      

      
    ],
  );
 final place4 =  ProductModel(
    name: "Maui",
    asset: "assets/images/maui.jpeg",
    location: "Hawaii",
    rating: 4.5,
    price: 999,
    headline: "One of the Best Place on Earth",
    desc:
        "This Hawaiian island offers a wide range of experiences for visitors. You can surf, enjoy a meal on the beach at a five-star luxury resort in Wailea, ride a horse across a dormant volcano in Haleakala National Park, or hike through a rainforest in the West Maui Mountains. The natural scenery is amazing-it's truly one of the most beautiful islands in the world.",
    testimonials: [
      "assets/images/profile_1.jpeg",
      "assets/images/profile_2.jpeg",
      "assets/images/profile_3.jpeg",
      "assets/images/profile_4.jpeg",
    ],
     photos: [
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      
    ],
  );
  final List <ProductModel> productList = [
   place1,
   place2,
   place4,
   place4
 ];



