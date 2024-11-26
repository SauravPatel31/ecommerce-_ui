abstract class CreateOrderState{}

class CreateOrderIntialState extends CreateOrderState{}
class CreateOrderLoadingState extends CreateOrderState{}
class CreateOderSuccessState extends CreateOrderState{}
class CreateOrderFaliureState extends CreateOrderState{
  String errorMsg;
  CreateOrderFaliureState({required this.errorMsg});
}