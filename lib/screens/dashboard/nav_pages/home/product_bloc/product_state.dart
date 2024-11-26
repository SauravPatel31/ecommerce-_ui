import 'package:ecommerce_app/data/model/product_data_model.dart';

abstract class ProductState{}

class ProductIntialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  ProductModel mData;
  ProductLoadedState({required this.mData});
}
class ProductErrorState extends ProductState{
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}

