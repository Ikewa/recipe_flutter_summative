import 'dart:convert';

import 'package:http/http.dart' as http;

class ConstantFunction{




  static Future<List<Map<String,dynamic>>> getResponse(String findRecipe)async{
    String id='6bf6c63c';
    String key='d6fa0136d65386bdc89b9c9089547380';

    String api='https://api.edamam.com/search?q=Breakfast&app_id=6bf6c63c&app_key=d6fa0136d65386bdc89b9c9089547380&from=0&to=10&calories=591-722&health=alcohol-free';
    final response=await http.get(Uri.parse(api));
    List<Map<String,dynamic>> recipe=[];
    if(response.statusCode==200){
      var data=jsonDecode(response.body);

      if(data['hits']!=null){
        for(var hit in data['hits']){
          recipe.add(hit['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }


}