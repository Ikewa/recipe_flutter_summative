import 'package:flutter/material.dart';
import 'package:ismail_recipe_app_2/constant/images_path.dart';

import '../component/home_app_bar.dart';
import '../component/tab_bar_widget.dart';
import '../component/text_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
          SizedBox(
            height: h*.022,
          ),
           TextFieldWidget(),
            SizedBox(
              height: h*.022,
            ),
            Container(
              height: h*.25,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImagesPath.explore),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            SizedBox(height: h*.023,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories',
                style: TextStyle(
                  fontSize: w*.045,
                  fontWeight: FontWeight.bold
                ),
                ),
                const Text('See all'),
                SizedBox(height: w*.022,)
              ],
            ),
            SizedBox(height: w*.022,),
            const TabBarWidget()
          ],
        ),
        ),
      ),),
    );
  }
}
