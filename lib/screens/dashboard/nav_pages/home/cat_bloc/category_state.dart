import 'package:ecommerce_app/data/model/category_model.dart';

abstract class CategoryState{}

class CategoryIntialState extends CategoryState{}
class CategoryLoadingState extends CategoryState{}
class CategoryLoadedState extends CategoryState{
  CategoryModel mData;
  CategoryLoadedState({required this.mData});
}
class CategoryErrorState extends CategoryState{
  String errorMsg;
  CategoryErrorState({required this.errorMsg});
}