import '../../../../../data/model/user_profile_model.dart';

abstract class ProfileState{}

class ProfileIntialState extends ProfileState{}
class ProfileLoadingState extends ProfileState{}
class ProfileLoadedState extends ProfileState{
  UserProfileModel mData;
  ProfileLoadedState({required this.mData});
}
class ProfileErrorState extends ProfileState{
  String errorMsg;
  ProfileErrorState({required this.errorMsg});
}