import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransportSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: screenWidth / 1.2,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://i0.wp.com/singabalitransport.com/wp-content/uploads/2020/04/sewa-mobil-mewah-di-bali-1.jpg?fit=1024%2C682&ssl=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: screenWidth / 1.2,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://lovebalitrans.com/wp-content/uploads/2022/12/sli-head.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: screenWidth / 1.2,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://www.kutatransport.com/wp-content/uploads/2022/12/bali-car-charter.jpg",
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
