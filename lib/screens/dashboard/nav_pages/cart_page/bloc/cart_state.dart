import '../../../../../data/model/view_cart_model.dart';

abstract class CartState{}

class CartInitialState extends CartState{}
class CartLoadingState extends CartState{}
class CartLoadedState extends CartState{
  CartDataModel mData;
  CartLoadedState({required this.mData});
}
class CartErrorState extends CartState{
  String errorMsg;
  CartErrorState({required this.errorMsg});
}
