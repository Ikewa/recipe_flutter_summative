import 'package:flutter/material.dart';
import 'package:ismail_recipe_app_2/component/custom_clip_path.dart';

import '../component/circle_button.dart';
import '../component/ingredient_list.dart';

class DetailScreen extends StatefulWidget {
  final Map<String,dynamic> item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    String time=widget.item['totalTime'].toString();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h*.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.item['image']),fit: BoxFit.cover)
                  ),
                ),
                Positioned(
                  top: h*.04, left: w*.05,
                    child:const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                child: BackButton(color: Colors.yellow,),
                    )
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: w*.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(widget.item['label'],
                  style: TextStyle(
                    fontSize: w*.05,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                  ),
                  const SizedBox(height: 1,),
                  Text("$time min"),
                  SizedBox(height: h*.01,),
        
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleButton(
                        icon: Icons.share,label: 'Share',
                      ),
                      CircleButton(
                        icon: Icons.bookmark_border,label: 'Save',
                      ),
                      CircleButton(
                        icon: Icons.monitor_heart_outlined,label: 'Calories',
                      ),
                      CircleButton(
                        icon: Icons.table_chart_outlined,label: 'Unit Chart',
                      ),
                    ],
                  ),
                  SizedBox(height: h*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Steps',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w*.06,
                        ),
                      ),
                    SizedBox(width: w*.34,
                    child: ElevatedButton(onPressed: (){},
                        child:const Text('Start')),),
                    ],
                  ),
                  SizedBox(height: h*.02,),
                  Container(
                    height: h*.07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                          child: Container(
                            color: Colors.redAccent,
                            child: Center(
                              child: Text('Ingredients',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: w*.05,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ),
                        Expanded(
                          flex: 1,
                            child: Container(
                              color: Colors.white,
                              child: const Center(
                                child: Text('Items'),
                              ),
                            ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: h*1.8,
                  child: IngredientList(
                    ingredients: widget.item['ingredients'],
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
