import 'package:regwalls/model/categories_model.dart';

String apiKey = "01dV8NfN3Eve12VlKutbryGYulaFRbftOYYU5ev09mmG0JCSjD978reo";

List<CategoriesModel> getCategories() {

  List<CategoriesModel> categories = [];
  CategoriesModel categoryModel = CategoriesModel();


  categoryModel.categorieName = "Minimal";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "Pastel";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "Amoled";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "Street Art";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "Nature";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "City";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "Football";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();


  categoryModel.categorieName = "Cars";
  categories.add(categoryModel);
  categoryModel = CategoriesModel();



  return categories;
}