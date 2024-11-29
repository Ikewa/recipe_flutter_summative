import 'package:flutter/material.dart';
import 'package:ismail_recipe_app_2/constant/constant_function.dart';

import '../screens/detail_screen.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: h * 0.05,
            child: TabBar(
              unselectedLabelColor: Colors.red,
              labelColor: Colors.yellow,
              dividerColor: Colors.grey,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: w * 0.012),
              tabs: const [
                TabItems(title: 'Breakfast'),
                TabItems(title: 'Lunch'),
                TabItems(title: 'Dinner'),
                TabItems(title: 'Snacks'),
              ],
            ),
          ),
          SizedBox(height: h * 0.02),
          SizedBox(
            height: h * 0.3,
            child: const TabBarView(
              children: [
                HomeTabBarView(recipe: 'Breakfast'),
                HomeTabBarView(recipe: 'Lunch'),
                HomeTabBarView(recipe: 'Dinner'),
                HomeTabBarView(recipe: 'Snacks'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabItems extends StatelessWidget {
  final String title;
  const TabItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 9.8),
          ),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String recipe;
  const HomeTabBarView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: ConstantFunction.getResponse(recipe),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
          return const Center(
            child: Text('No Data!'),
          );
        }

        List<Map<String, dynamic>> recipes = snapshot.data as List<Map<String, dynamic>>;

        return SizedBox(
          height: h * 0.28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Map<String, dynamic> snap = recipes[index];
              int time = snap['totalTime']?.toInt() ?? 0;
              int calories = snap['calories']?.toInt() ?? 0;

              return Container(
                margin: EdgeInsets.only(right: w * 0.02),
                width: w * 0.5,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(item: snap),
                          ),
                        );
                      },
                      child: Container(
                        width: w,
                        height: h * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(snap['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Text(
                      snap['label'],
                      style: TextStyle(
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Text(
                      "${calories.toString()} . ${time.toString()} Min",
                      style: TextStyle(
                        fontSize: w * 0.03,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
            itemCount: recipes.length,
          ),
        );
      },
    );
  }
}
