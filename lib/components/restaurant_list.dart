import 'package:flutter/material.dart';
import 'package:submission1_fund_flutter/utils/color_random.dart';
import '../data/model/response/restaurant.dart';
import '../ui/details_screens.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen', fontSize: 13);

class RestaurantList extends StatelessWidget {
  final Restaurant restaurants;

  const RestaurantList({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailsScreens.routeName,
                  arguments: restaurants);
            },
            child: Container(
              height: 115,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: createRandomColor().shade100.withOpacity(.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      minHeight: 115,
                      maxWidth: 120,
                      maxHeight: 115,
                    ),
                    child: ClipRRect(
                      child: Image.network(restaurants.getSmallPicture(),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurants.name,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Kota",
                                  style: TextStyle(
                                      fontFamily: 'Oxygen',
                                      fontSize: 12,
                                      color: Colors.black54),
                                ),
                                const TextSpan(
                                  text: " : ",
                                  style: TextStyle(
                                      fontFamily: 'Oxygen',
                                      fontSize: 12,
                                      color: Colors.black54),
                                ),
                                TextSpan(
                                  text: restaurants.city,
                                  style: const TextStyle(
                                      fontFamily: 'Oxygen',
                                      fontSize: 12,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${restaurants.rating}',
                                style: const TextStyle(
                                    fontFamily: 'Oxygen',
                                    fontSize: 12,
                                    color: Colors.black54),
                              ),
                              const Icon(
                                IconData(0xe5f9, fontFamily: 'MaterialIcons'),
                                size: 12,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    // return FutureBuilder<String>(
    //   future: DefaultAssetBundle.of(context)
    //       .loadString('assets/local_restaurant.json'),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState != ConnectionState.done) {
    //       // loading widget
    //       return const Center(child: CircularProgressIndicator());
    //     } else {
    //       if (snapshot.hasData) {
    //         final List<RestaurantElement> restaurant =
    //             parseRestaurant(snapshot.data!);
    //         return Column(
    //           children: List.generate(
    //             restaurant.length,
    //             (index) => GestureDetector(
    //               onTap: () {
    //                 Navigator.pushNamed(context, DetailsScreens.routeName,
    //                     arguments: restaurant[index]);
    //               },
    //               child: Container(
    //                 height: 115,
    //                 padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
    //                 margin:
    //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //                 decoration: BoxDecoration(
    //                   color: createRandomColor().shade100.withOpacity(.8),
    //                   borderRadius: BorderRadius.circular(15),
    //                 ),
    //                 child: Row(
    //                   children: [
    //                     ConstrainedBox(
    //                       constraints: const BoxConstraints(
    //                         minWidth: 100,
    //                         minHeight: 115,
    //                         maxWidth: 120,
    //                         maxHeight: 115,
    //                       ),
    //                       child: ClipRRect(
    //                         child: Image.network(restaurant[index].pictureId,
    //                             fit: BoxFit.cover),
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               restaurant[index].name,
    //                               style: const TextStyle(
    //                                   fontSize: 18,
    //                                   color: Colors.black87,
    //                                   fontWeight: FontWeight.w800),
    //                             ),
    //                             RichText(
    //                               text: TextSpan(
    //                                 children: [
    //                                   const TextSpan(
    //                                     text: "Kota",
    //                                     style: TextStyle(
    //                                         fontFamily: 'Oxygen',
    //                                         fontSize: 12,
    //                                         color: Colors.black54),
    //                                   ),
    //                                   const TextSpan(
    //                                     text: " : ",
    //                                     style: TextStyle(
    //                                         fontFamily: 'Oxygen',
    //                                         fontSize: 12,
    //                                         color: Colors.black54),
    //                                   ),
    //                                   TextSpan(
    //                                     text: restaurant[index].city,
    //                                     style: const TextStyle(
    //                                         fontFamily: 'Oxygen',
    //                                         fontSize: 12,
    //                                         color: Colors.black54),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Text(
    //                                   '${restaurant[index].rating}',
    //                                   style: const TextStyle(
    //                                       fontFamily: 'Oxygen',
    //                                       fontSize: 12,
    //                                       color: Colors.black54),
    //                                 ),
    //                                 const Icon(
    //                                   IconData(0xe5f9,
    //                                       fontFamily: 'MaterialIcons'),
    //                                   size: 12,
    //                                 )
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     }
    //   },
    // );
  }
}
