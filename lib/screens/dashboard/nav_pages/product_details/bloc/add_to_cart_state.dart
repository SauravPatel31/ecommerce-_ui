abstract class AddToCartsState{}

class AddToCartInitialState extends AddToCartsState{}
class AddToCartLoadingState extends AddToCartsState{}
class AddToCartSuccessState extends AddToCartsState{}
class AddToCartFaliureState extends AddToCartsState{
  String errorMsg;
  AddToCartFaliureState({required this.errorMsg});
}