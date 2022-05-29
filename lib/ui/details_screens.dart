import 'package:flutter/material.dart';
import 'package:submission1_fund_flutter/data/model/response/restaurant.dart';
import '../../utils/color_random.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen', fontSize: 13);

class DetailsScreens extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const DetailsScreens({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: createRandomColor().shade100.withOpacity(.8),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(restaurant.pictureId),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const FavoriteButton(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: DraggableScrollableSheet(
              expand: true,
              minChildSize: .7,
              maxChildSize: .9,
              initialChildSize: .7,
              builder: (context, scrollController) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, -4),
                          color: Colors.blue[800]!.withOpacity(.2))
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "About " + restaurant.name,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          restaurant.description,
                          style: informationTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Drinks',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: restaurant.menus.drinks.map((url) {
                              return Row(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(4.0, 0.0, 20.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Text(url.name),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Foods',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: restaurant.menus.foods.map((url) {
                              return Row(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(4.0, 0.0, 20.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Text(url.name),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
