import 'package:flutter/material.dart';

class AdventuresSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 200,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            width: screenWidth / 1.7,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//87/MTA-20301870/travel_trip_travel_trip_open_trip_bali-_tour_bali_full01_6d340d5a.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            width: screenWidth / 1.7,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://i0.wp.com/www.baliajeg.com/wp-content/uploads/2022/09/bg-3.jpg?fit=730%2C481&ssl=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            width: screenWidth / 1.7,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://storage.googleapis.com/muslimpergi/uploads/listing/pict/851/medium_bali_3_hari.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
