import 'package:circle/injection.dart';
import 'package:circle/widgets/dialogs/scaffold_messanger.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/api_response.dart';
import '../../../../../data/models/categoryModel.dart';
import '../../../../../data/repositories/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryRepository categoryRepository = getIt();
  List<CategoryModel> categories = [];
  int _selectedCategoryIndex = 0;
  int _selectedSubCategoryIndex = 0;
  int? _categoryId = null;
  int? _subCategoryId = null;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  int get selectedSubCategoryIndex => _selectedSubCategoryIndex;
  int? get categoryId => _categoryId;
  int? get subCategoryId => _subCategoryId;

  Future<void> fetchCategoryData() async {
    print('getitnDataApi');
    try {
      ApiResponse response = await categoryRepository.getData();
      if (response.response != null) {
        if (response.response?.statusCode == 200) {
          if (response.response?.data['code'] == 200) {
            var data = response.response?.data['data'] as List<dynamic>;
            categories = List<CategoryModel>.from(
              data.map((item) => CategoryModel.fromJson(item)),
            );
            categories.shuffle();
            notifyListeners();
          } else if (response.response?.data['code'] == 422) {
            CustomScaffoldMessanger.showToast(
                title: '${response.response?.data['message']}');
          }
        } else {
          print('ErrorData=>>${response.response?.statusCode}');
        }
      } else {
        print('ErrorData=>>${response.error}');
      }
    } catch (e) {
      print('errorGetCategory=>>>$e');
    }
  }

  void selectCategory(int categoryIndex) {
    _selectedCategoryIndex = categoryIndex;
    notifyListeners();
  }

  void selectSubCategory(int subCategoryIndex) {
    _selectedSubCategoryIndex = subCategoryIndex;
    notifyListeners();
  }

  void getId(int categoryId, int subCategoryId) {
    _subCategoryId = subCategoryId;
    _categoryId = categoryId;
    notifyListeners();
  }
}
