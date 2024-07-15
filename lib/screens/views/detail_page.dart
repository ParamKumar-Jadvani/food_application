import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_application/extension.dart';

import '../../utils/recipe.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color fav = Colors.black;
  Color disfav = Colors.pink;
  Color red = Colors.red;
  Color yellow = Colors.yellow;
  Color green = Colors.green;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> food =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(food['name']),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('meal_Page');
            },
            icon: const Icon(
              Icons.no_meals_rounded,
              size: 25,
            ),
          ),
          10.w,
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 8, 14, 0),
            padding: const EdgeInsets.all(16),
            width: size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 28,
                  offset: Offset(0, 14),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.22),
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(food['image']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(14, 30, 37, 0.12),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(14, 30, 37, 0.32),
                        blurRadius: 16,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                15.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.68,
                      child: Text(
                        textAlign: TextAlign.start,
                        food['name'].toString().tCase,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (!favoriteData.contains(food)) {
                            favoriteData.add(food);
                          } else {
                            favoriteData.remove(food);
                          }
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color: (favoriteData.contains(food))
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                13.h,
                Row(
                  children: [
                    const Text(
                      'Difficulty : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    4.w,
                    Text(
                      food['difficulty'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: (food['difficulty'] == 'Easy')
                            ? green
                            : (food['difficulty'] == 'Medium')
                                ? yellow
                                : (food['difficulty'] == 'Hard')
                                    ? red
                                    : green,
                      ),
                    ),
                  ],
                ),
                13.h,
                Row(
                  children: [
                    const Text(
                      'Rating : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    3.w,
                    Text(
                      food['rating'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    5.w,
                    RatingBarIndicator(
                      rating: food['rating'].toDouble(),
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                13.h,
                Row(
                  children: [
                    const Text(
                      'Meal Type : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ...food['mealType'].map((e) {
                      return Text(
                        '${e.toString().tCase}  ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      );
                    })
                  ],
                ),
                13.h,
                Row(
                  children: [
                    const Text(
                      'Total Time : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ...durationTime.map((elem) => (food['id'] == elem['id'])
                        ? (elem['totalTime']['hour'] == 0)
                            ? Text(
                                ' ${elem['totalTime']['min'].toString()} Minutes',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                '${elem['totalTime']['hour'].toString()} Hours ${elem['totalTime']['min'].toString()} Minutes',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                        : Text('')),
                  ],
                ),
                13.h,
                SizedBox(
                  width: size.width * 0.4,
                  child: TextButton(
                    onPressed: () {
                      if (!mealData.contains(food)) {
                        mealData.add(food);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.set_meal,
                          size: 17,
                          color: Colors.white,
                        ),
                        10.w,
                        const Text(
                          'Add To Meal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
