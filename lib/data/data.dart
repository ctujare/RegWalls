import 'package:regwalls/model/categories_model.dart';

String apiKey = "01dV8NfN3Eve12VlKutbryGYulaFRbftOYYU5ev09mmG0JCSjD978reo";

List<CategoriesModel> getCategories() {

  List<CategoriesModel> categories = [];
  CategoriesModel categorieModel = CategoriesModel();


  categorieModel.categorieName = "Street Art";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();


  categorieModel.categorieName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();


  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();


  categorieModel.categorieName = "City";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();


  categorieModel.categorieName = "Motivation";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();


  categorieModel.categorieName = "Bikes";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();


  categorieModel.categorieName = "Cars";
  categories.add(categorieModel);
  categorieModel = CategoriesModel();

  return categories;
}