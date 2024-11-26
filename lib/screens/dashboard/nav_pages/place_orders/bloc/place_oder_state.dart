import '../../../../../data/model/place_oder_model.dart';

abstract class PlaceOderState{}

class PlaceOderIntialState extends PlaceOderState{}
class PlaceOderLoadingState extends PlaceOderState{}
class PlaceOderLoadedState extends PlaceOderState{
  PlaceOrderModel mData;
  PlaceOderLoadedState({required this.mData});
}
class PlaceOderErrorState extends PlaceOderState{
  String errorMessage;
  PlaceOderErrorState({required this.errorMessage});
}