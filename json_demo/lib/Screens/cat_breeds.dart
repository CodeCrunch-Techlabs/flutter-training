import 'package:jsondemo/api/cats_api.dart';

void getCatData() async {
  var result = await CatAPI().getCatBreeds();
  print(result);
}
