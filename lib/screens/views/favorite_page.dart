import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_application/extension.dart';
import 'package:food_application/utils/recipe.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Color fav = Colors.black;
  Color disfav = Colors.pink;
  Color red = Colors.red;
  Color yellow = Colors.yellow;
  Color green = Colors.green;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        title: const Text(
          'Favorite Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
        child: (favoriteData.isEmpty)
            ? Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/blogger-review-concept-with-smartphone_23-2148519563.jpg?w=1380&t=st=1721059539~exp=1721060139~hmac=0adf9a3bd29094e219c45b747be82773029b2de34f3fca054b1fca7a51d29235',
                  width: size.width * 1,
                  height: size.height * 1,
                  fit: BoxFit.contain,
                ),
              )
            : Column(
                children: favoriteData.map((e) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                    padding: const EdgeInsets.all(16),
                    height: size.height * 0.5,
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
                              image: NetworkImage(e['image']),
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
                        SizedBox(
                          width: size.width * 0.68,
                          child: Text(
                            textAlign: TextAlign.start,
                            e['name'].toString().tCase,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        13.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Difficulty : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  e['difficulty'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: (e['difficulty'] == 'Easy')
                                        ? green
                                        : (e['difficulty'] == 'Medium')
                                            ? yellow
                                            : (e['difficulty'] == 'Hard')
                                                ? red
                                                : green,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: e['rating'].toDouble(),
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 18,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                3.w,
                                Text(
                                  e['rating'].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                            ...e['mealType'].map((e) {
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
                            ...durationTime
                                .map((elem) => (e['id'] == elem['id'])
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
                                    : const Text('')),
                          ],
                        ),
                        13.h,
                        SizedBox(
                          width: size.width * 0.60,
                          child: TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  favoriteData.remove(e);
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  size: 25,
                                  color: Colors.red,
                                ),
                                8.w,
                                const Text(
                                  'Remove from  Favorite',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
