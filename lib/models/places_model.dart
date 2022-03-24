import 'dart:convert';

List<PlacesModel> placesModelFromJson(String str) => List<PlacesModel>.from(
    json.decode(str).map((x) => PlacesModel.fromJson(x)));

String placesModelJson(List<PlacesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlacesModel {
  PlacesModel({
    required this.id,
    required this.name,
    required this.state,
    required this.city,
    required this.recommended,
    required this.catogory,
    required this.about,
    required this.openingTime,
    required this.closingTime,
    required this.entryFee,
    required this.images,
    required this.packages,
  });

  String id;
  String name;
  String state;
  String city;
  String recommended;
  String catogory;
  String about;
  String openingTime;
  String closingTime;
  List<EntryFee> entryFee;
  List<PlaceImage> images;
  List<Package> packages;

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        id: json["_id"],
        name: json["name"],
        state: json["state"],
        city: json["city"],
        recommended: json["recommended"],
        catogory: json["catogory"],
        about: json["about"],
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        entryFee: List<EntryFee>.from(
            json["entry_fee"].map((x) => EntryFee.fromJson(x))),
        images: List<PlaceImage>.from(
            json["images"].map((x) => PlaceImage.fromJson(x))),
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "state": state,
        "city": city,
        "recommended": recommended,
        "catogory": catogory,
        "about": about,
        "opening_time": openingTime,
        "closing_time": closingTime,
        "entry_fee": List<dynamic>.from(entryFee.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
      };
}

class EntryFee {
  EntryFee({
    required this.id,
    required this.indianEntryFee,
    required this.foreignEntryFee,
    required this.photography,
    required this.videography,
  });

  String id;
  int indianEntryFee;
  int foreignEntryFee;
  int photography;
  int videography;

  factory EntryFee.fromJson(Map<String, dynamic> json) => EntryFee(
        id: json["_id"],
        indianEntryFee: json["indian_entry_fee"],
        foreignEntryFee: json["foreign_entry_fee"],
        photography: json["photography"],
        videography: json["videography"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "indian_entry_fee": indianEntryFee,
        "foreign_entry_fee": foreignEntryFee,
        "photography": photography,
        "videography": videography,
      };
}

class PlaceImage {
  PlaceImage({
    required this.id,
    required this.img,
  });

  String id;
  String img;

  factory PlaceImage.fromJson(Map<String, dynamic> json) => PlaceImage(
        id: json["_id"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
      };
}

class Package {
  Package({
    required this.id,
    required this.pkName,
    required this.pkDetails,
    required this.pkImage,
    required this.pkPrice,
  });

  String id;
  String pkName;
  String pkDetails;
  String pkImage;
  int pkPrice;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["_id"],
        pkName: json["pk_name"],
        pkDetails: json["pk_details"],
        pkImage: json["pk_image"],
        pkPrice: json["pk_price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pk_name": pkName,
        "pk_details": pkDetails,
        "pk_image": pkImage,
        "pk_price": pkPrice,
      };
}
