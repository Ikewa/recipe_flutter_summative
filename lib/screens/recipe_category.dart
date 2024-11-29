import 'package:flutter/material.dart';
import 'package:ismail_recipe_app_2/component/recipe_category_view.dart';

import '../constant/category_list.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: w*.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: h*.06,),
          Text('For You',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: w*.06,
          ),
          ),
          SizedBox(height: h*.01,),
          SizedBox(
            height: h*.106,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCategoryView(name:name[0], image:images[0]),
                RecipeCategoryView(name:name[1], image:images[1]),
                RecipeCategoryView(name:name[2], image:images[2]),
                RecipeCategoryView(name:name[3], image:images[3]),
              ],
            ),
          ),

        ],
      ),
      ),
    );
  }
}
