import 'package:flutter/material.dart';
import 'package:travio/models/places.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

List<Places> places = [
  const Places(
    name: "Lingaraj temple",
    category: "Temples",
    imageUrl:
        "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_611296796_20200218173507_20200218173559.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Rise',
  ),
  const Places(
    name: "Rajarani temple",
    category: "Temples",
    imageUrl:
        "https://res.cloudinary.com/thrillophilia/image/upload/c_fill,f_auto,fl_progressive.strip_profile,g_auto,h_600,q_auto,w_auto/v1/filestore/yiv7jim2ocipr092gkkmazqlznwo_1587447431_Rajarani_Temple.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 35.30,
    prediction: 'Fall',
  ),
  const Places(
    name: "Nico Park",
    category: "Parks",
    imageUrl:
        "https://bhubaneswartourism.in/images//tourist-places/ocean-world-water-park-bhubaneswar/ocean-world-water-park-bhubaneswar-tourism-entry-ticket-price.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Rise',
  ),
  const Places(
    name: "Nandankanan",
    category: "Parks",
    imageUrl: "https://i.ytimg.com/vi/QDjNR00WUbA/maxresdefault.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Same',
  ),
  const Places(
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

class TripCard extends StatelessWidget {
  TripCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: FittedBox(
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  child: SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Image.network(places[index].imageUrl,
                        fit: BoxFit.cover, width: 200.0),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: Container(
                    height: 38.0,
                    width: 38.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white38,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 9.0,
                      ),
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 140.0,
              width: screenWidthPercentage(context, percentage: 0.4),
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                borderRadius: const BorderRadius.only(
                  topRight: const Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        places[index].name,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan.shade700,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        'Lingaraj rd ,Old Town, Bhubanewar',
                        style: TextStyle(
                          fontSize: 11.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.cyan.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
