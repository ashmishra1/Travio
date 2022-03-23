class MyTripModel {
  final String name;
  final String category;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  final double crowd;
  final String prediction;

  const MyTripModel({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    required this.crowd,
    required this.prediction,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, isRecommended, isPopular];

  static List<MyTripModel> products = [
    const MyTripModel(
      name: "Lingaraj temple",
      category: "Temples",
      imageUrl:
          "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_611296796_20200218173507_20200218173559.jpg",
      isRecommended: true,
      isPopular: true,
      crowd: 25.80,
      prediction: 'Rise',
    ),
    const MyTripModel(
      name: "Rajarani temple",
      category: "Temples",
      imageUrl:
          "https://res.cloudinary.com/thrillophilia/image/upload/c_fill,f_auto,fl_progressive.strip_profile,g_auto,h_600,q_auto,w_auto/v1/filestore/yiv7jim2ocipr092gkkmazqlznwo_1587447431_Rajarani_Temple.jpg",
      isRecommended: true,
      isPopular: true,
      crowd: 35.30,
      prediction: 'Fall',
    ),
    const MyTripModel(
      name: "Nico Park",
      category: "Parks",
      imageUrl:
          "https://bhubaneswartourism.in/images//tourist-places/ocean-world-water-park-bhubaneswar/ocean-world-water-park-bhubaneswar-tourism-entry-ticket-price.jpg",
      isRecommended: true,
      isPopular: true,
      crowd: 25.80,
      prediction: 'Rise',
    ),
    const MyTripModel(
      name: "Nandankanan",
      category: "Parks",
      imageUrl: "https://i.ytimg.com/vi/QDjNR00WUbA/maxresdefault.jpg",
      isRecommended: true,
      isPopular: true,
      crowd: 25.80,
      prediction: 'Same',
    ),
    const MyTripModel(
      name: "Nico Park",
      category: "Parks",
      imageUrl:
          "https://bhubaneswartourism.in/images//tourist-places/ocean-world-water-park-bhubaneswar/ocean-world-water-park-bhubaneswar-tourism-entry-ticket-price.jpg",
      isRecommended: true,
      isPopular: true,
      crowd: 25.80,
      prediction: 'Fall',
    ),
  ];
}
