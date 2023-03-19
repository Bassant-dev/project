abstract class SocialRegisterStates {}
class SocialRegisterInitialState extends SocialRegisterStates {}
class SocialRegisterChangePasswordVisibilityState extends SocialRegisterStates {}
class SocialRegisterLoadingState extends SocialRegisterStates {}

class SocialRegisterSuccessState extends SocialRegisterStates
{

}
class SocialRegisterErrorState extends SocialRegisterStates
{
  final String error;

  SocialRegisterErrorState(this.error);
}


class SocialCreateUserSuccessState extends SocialRegisterStates
{

}

class SocialCreateUserErrorState extends SocialRegisterStates
{
  final String error;

  SocialCreateUserErrorState(this.error);
}
class SocialGetUserSuccessStates extends SocialRegisterStates{ }
class SocialGetUserLoadingStates extends SocialRegisterStates{ }
class SocialGetUserErrorStates extends SocialRegisterStates{}

class InitShopState extends SocialRegisterStates{}

class ChangeBottomNavState extends SocialRegisterStates{}
class FavoritesInitialState extends SocialRegisterStates{}
class FavoritesSuccessfully extends SocialRegisterStates{}
class RemovedSuccessfully extends SocialRegisterStates{}


