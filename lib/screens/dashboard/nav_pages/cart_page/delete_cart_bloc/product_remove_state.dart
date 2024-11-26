abstract class ProductRemoveState{}

class ProductRemoveInitialState extends ProductRemoveState{}
class ProductRemoveLoadingState extends ProductRemoveState{}
class ProductRemoveSuccessState extends ProductRemoveState{}
class ProductRemoveFaliureState extends ProductRemoveState{
  String errorMsg;
  ProductRemoveFaliureState({required this.errorMsg});}
