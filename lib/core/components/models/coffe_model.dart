// import 'dart:developer';

class CoffeModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String region;
  final String weight;
  final List flavorProfile;
  final List grindOption;
  final int roastLevel;
  final String imageUrl;

  CoffeModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.region,
      required this.weight,
      required this.flavorProfile,
      required this.grindOption,
      required this.roastLevel,
      required this.id,
      required this.imageUrl
      });

  factory CoffeModel.fromJson(json) {
    // log( json['description']);
    return CoffeModel(
        description: json['description'],
        price: json['price'].toString(),
        region: json['region'],
        weight: json['weight'].toString(),
        flavorProfile: json['flavor_profile'] ,
        grindOption: json['grind_option'],
        roastLevel: json['roast_level'],
        imageUrl: json['image_url'],
        name: json['name'],
        id: json['id']
        );
  }
}
